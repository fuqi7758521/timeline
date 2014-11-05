package com.hofuqi.timeline.common.criteria;

import com.hofuqi.timeline.common.to.ItemTO;

/**
 * 条目查询条件实体类
 * @author fuqi
 * @date 2014-10-13
 */
public class ItemCriteria extends ItemTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<ItemTO> pageModel;

	public SearchPagerModel<ItemTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<ItemTO> pageModel) {
		this.pageModel = pageModel;
	}
	
	
}
