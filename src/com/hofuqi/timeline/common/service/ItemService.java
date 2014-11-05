package com.hofuqi.timeline.common.service;

import java.util.List;

import com.hofuqi.timeline.common.criteria.ItemCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.to.ItemTO;

public interface ItemService {
	
	void add(ItemTO to);
	
	void update(ItemTO to);
	
	void delete(Long id);
	
	ItemTO getItem(ItemCriteria criteria);
	
	List<ItemTO> getItems(ItemCriteria criteria);
	
	Long getSumMinsItemsOfTime(Long planId);
	
	Integer getItemsCnt(ItemCriteria criteria);
	
	SearchPagerModel<ItemTO> getPlansPagerModel(ItemCriteria criteria);
	
	List<ItemTO> getItemsChart(ItemCriteria criteria);
	
}
