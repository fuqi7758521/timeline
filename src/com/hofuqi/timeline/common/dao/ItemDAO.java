package com.hofuqi.timeline.common.dao;

import java.util.List;

import com.hofuqi.timeline.common.criteria.ItemCriteria;
import com.hofuqi.timeline.common.to.ItemTO;

public interface ItemDAO {
	
	void add(ItemTO to);
	
	void update(ItemTO to);
	
	void delete(Long id);
	
	List<ItemTO> getItems(ItemCriteria criteria);
	
	Long getSumMinsItemsOfTime(Long planId);
	
	List<ItemTO> getItemsChart(ItemCriteria criteria);
	
	Integer getItemsCnt(ItemCriteria criteria);
	
	ItemTO getItem(ItemCriteria criteria);
	
}
