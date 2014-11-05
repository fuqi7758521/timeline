package com.hofuqi.timeline.ui.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hofuqi.timeline.common.criteria.PlanCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.service.PlanService;
import com.hofuqi.timeline.common.to.PlanTO;
import com.hofuqi.timeline.common.to.UserTO;
import com.hofuqi.timeline.common.util.AcsUtil;
import com.hofuqi.timeline.common.util.RequestUtil;

/**
 * 计划controller
 * @author fuqi
 * @date 2014-10-13
 */
@Controller
public class PlanController {
	
	//计划页面
	public static final String PLANS_PAGE = "/WEB-INF/pages/plans.jsp";
	
	private static Integer PAGE_SIZE = 8;
	
	@Autowired
	private PlanService planService;
	
	//计划列表页
	@RequestMapping("plans.html")
	public ModelAndView plans(HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		Integer pageNum = RequestUtil.getInteger(request, "pageNum") == null ? 1 : RequestUtil.getInteger(request, "pageNum");
		Integer pageSize  = RequestUtil.getInteger(request, "pageSize") == null ? PAGE_SIZE : RequestUtil.getInteger(request, "pageSize");
		request.setAttribute("pageNum", pageNum);
		String content = RequestUtil.getString(request, "content");
		PlanCriteria criteria = new PlanCriteria();
		criteria.setUserId(loginUser.getId());
		criteria.setContent(content);
		SearchPagerModel<PlanTO> pagerModel = new SearchPagerModel<PlanTO>((pageNum - 1) * pageSize, pageSize);
		criteria.setPageModel(pagerModel);
		pagerModel = planService.getPlansPagerModel(criteria);
		request.setAttribute("plans", pagerModel.getResultList());
		
		int total = pagerModel.getTotal();
		request.setAttribute("total", total);
		int pages = 0;
		if(total % pageSize != 0){
			pages = total / pageSize + 1;
		}else{
			pages = total / pageSize;
		}
		request.setAttribute("pages", pages);
		
		return new ModelAndView(PLANS_PAGE);
	}
	
	@RequestMapping("addPlan.html")
	public ModelAndView addPlan(PlanTO to, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		to.setUserId(loginUser.getId());
		planService.add(to);
		return new ModelAndView("redirect:plans.html");
	}
	
	@RequestMapping("updatePlan.html")
	public ModelAndView updatePlan(PlanTO to, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		planService.update(to);
		return new ModelAndView("redirect:plans.html");
	}
	
	@RequestMapping("delPlan.html")
	public ModelAndView delPlan(Long id, HttpServletRequest request){
		UserTO loginUser = AcsUtil.getLoginUser(request);
		if(loginUser == null){
			return new ModelAndView("redirect:login.html");
		}
		planService.delete(id);
		return new ModelAndView("redirect:plans.html");
	}
	
	
}
