package com.hofuqi.timeline.common.criteria;

import com.hofuqi.timeline.common.to.PlanTO;

/**
 * 计划查询条件实体类
 * 
 * @author fuqi
 * @date 2014-10-13
 */
public class PlanCriteria extends PlanTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<PlanTO> pageModel;

	public SearchPagerModel<PlanTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<PlanTO> pageModel) {
		this.pageModel = pageModel;
	}

}
