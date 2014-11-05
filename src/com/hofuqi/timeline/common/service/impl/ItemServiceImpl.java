package com.hofuqi.timeline.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hofuqi.timeline.common.criteria.ItemCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.dao.ItemDAO;
import com.hofuqi.timeline.common.service.ItemService;
import com.hofuqi.timeline.common.to.ItemTO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;
	
	@Override
	public void add(ItemTO to) {
		itemDAO.add(to);
	}

	@Override
	public ItemTO getItem(ItemCriteria criteria) {
		return itemDAO.getItem(criteria);
	}

	@Override
	public void update(ItemTO to) {
		itemDAO.update(to);
	}

	@Override
	public void delete(Long id) {
		itemDAO.delete(id);
	}

	@Override
	public List<ItemTO> getItems(ItemCriteria criteria) {
		return itemDAO.getItems(criteria);
	}

	@Override
	public Integer getItemsCnt(ItemCriteria criteria) {
		return itemDAO.getItemsCnt(criteria);
	}

	@Override
	public SearchPagerModel<ItemTO> getPlansPagerModel(ItemCriteria criteria) {
		SearchPagerModel<ItemTO> pager = criteria.getPageModel();
		if(pager == null){
			pager = new SearchPagerModel<ItemTO>();
		}
		Integer count = itemDAO.getItemsCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<ItemTO> result = itemDAO.getItems(criteria);
			pager.setResultList(result);
			pager.setTotal(count);
		}
		return pager;
	}

	@Override
	public List<ItemTO> getItemsChart(ItemCriteria criteria) {
		return itemDAO.getItemsChart(criteria);
	}

	@Override
	public Long getSumMinsItemsOfTime(Long planId) {
		return itemDAO.getSumMinsItemsOfTime(planId);
	}

}
