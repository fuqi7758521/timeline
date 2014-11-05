package com.hofuqi.timeline.ui.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hofuqi.timeline.common.criteria.ItemCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.service.ItemService;
import com.hofuqi.timeline.common.service.PlanService;
import com.hofuqi.timeline.common.to.ItemTO;
import com.hofuqi.timeline.common.to.PlanTO;
import com.hofuqi.timeline.common.to.UserTO;
import com.hofuqi.timeline.common.util.AcsUtil;
import com.hofuqi.timeline.common.util.DateUtil;
import com.hofuqi.timeline.common.util.RequestUtil;

/**
 * 条目controller
 * @author fuqi
 * @date 2014-10-13
 */
@Controller
public class ItemController {
	
	//条目页面
	public static final String ITEMS_PAGE = "/WEB-INF/pages/items.jsp";
	
	//计划页面
	public static final String PLANS_PAGE = "/WEB-INF/pages/plans.jsp";

	private static final Integer PAGE_SIZE = 10;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private PlanService planService;
	
	//条目列表页
	@RequestMapping("items.html")
	public ModelAndView items(ItemCriteria criteria, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		if(criteria.getPlanId() != null && criteria.getPlanId() != 0){
			Integer pageNum = RequestUtil.getInteger(request, "pageNum") == null ? 1 : RequestUtil.getInteger(request, "pageNum");
			Integer pageSize  = RequestUtil.getInteger(request, "pageSize") == null ? PAGE_SIZE : RequestUtil.getInteger(request, "pageSize");
			request.setAttribute("pageNum", pageNum);
			
			SearchPagerModel<ItemTO> pagerModel = new SearchPagerModel<ItemTO>((pageNum - 1) * pageSize, pageSize);
			criteria.setPageModel(pagerModel);
			pagerModel = itemService.getPlansPagerModel(criteria);
			request.setAttribute("items", pagerModel.getResultList());
			int total = pagerModel.getTotal();
			request.setAttribute("total", total);
			int pages = 0;
			if(total % pageSize != 0){
				pages = total / pageSize + 1;
			}else{
				pages = total / pageSize;
			}
			request.setAttribute("pages", pages);
			
			Long planId = criteria.getPlanId();
			PlanTO plan = planService.getPlan(planId);
			request.setAttribute("planName", plan.getTitle());
			
			Long totalMins = itemService.getSumMinsItemsOfTime(criteria.getPlanId());
			Long totalHours = totalMins != null ? totalMins / 60 : 0;
			
			request.setAttribute("totalHours", totalHours);
			request.setAttribute("categorys", new ArrayList<String>());
			request.setAttribute("datas", new ArrayList<Long>());
			
			return new ModelAndView(ITEMS_PAGE);
		}
		return new ModelAndView(PLANS_PAGE);
	}
	
	//图表显示
	@RequestMapping("itemsChart.html")
	public ModelAndView itemsChart(ItemCriteria criteria, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		List<ItemTO> items = itemService.getItemsChart(criteria);
		List<String> categorys = new ArrayList<String>();
		List<Long> datas = new ArrayList<Long>();
		for(ItemTO to : items){
			categorys.add("'" + DateUtil.formatDateTime(to.getCreatedDate(), DateUtil.SHORT_DATE_FORMAT) + "'");
			datas.add(to.getDiffMin());
		}
		Long planId = criteria.getPlanId();
		PlanTO plan = planService.getPlan(planId);
		request.setAttribute("planName", plan.getTitle());
		request.setAttribute("categorys", categorys);
		request.setAttribute("datas", datas);
		
		Long totalMins = itemService.getSumMinsItemsOfTime(criteria.getPlanId());
		Long totalHours = totalMins != null ? totalMins / 60 : 0;
		
		request.setAttribute("totalHours", totalHours);
		return new ModelAndView(ITEMS_PAGE);
	}
	
	//添加条目
	@RequestMapping("addItem.html")
	public ModelAndView addItem(ItemTO item, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		String startTime = RequestUtil.getString(request, "startTime");
		String endTime = RequestUtil.getString(request, "endTime");
		if(StringUtils.isNotBlank(startTime)){
			item.setStartTime(startTime);
		}else{
			item.setStartTime(null);
		}
		if(StringUtils.isNotBlank(endTime)){
			item.setEndTime(endTime);
		}else{
			item.setEndTime(null);
		}
		itemService.add(item);
		return new ModelAndView("redirect:items.html?planId=" + item.getPlanId());
	}
	
	//更新条目
	@RequestMapping("updateItem.html")
	public ModelAndView updateItem(ItemTO item, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		String startTime = RequestUtil.getString(request, "startTime");
		String endTime = RequestUtil.getString(request, "endTime");
		if(StringUtils.isNotBlank(startTime)){
			item.setStartTime(startTime);
		}else{
			item.setStartTime(null);
		}
		if(StringUtils.isNotBlank(endTime)){
			item.setEndTime(endTime);
		}else{
			item.setEndTime(null);
		}
		itemService.update(item);
		return new ModelAndView("redirect:items.html?planId=" + item.getPlanId());
	}
	
	//删除条目
	@RequestMapping("delItem.html")
	public ModelAndView delItem( HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		Long id = RequestUtil.getLong(request, "id");
		Long planId = RequestUtil.getLong(request, "planId");
		
		itemService.delete(id);
		
		return new ModelAndView("redirect:items.html?planId=" + planId);
		
	}
	
}
