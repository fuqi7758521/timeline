package com.hofuqi.timeline.common.service;

import java.util.List;

import com.hofuqi.timeline.common.criteria.PlanCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.to.PlanTO;

public interface PlanService {
	
	void add(PlanTO to);
	
	void update(PlanTO to);
	
	void delete(Long id);
	
	PlanTO getPlan(PlanCriteria criteria);
	
	PlanTO getPlan(Long id);
	
	List<PlanTO> getPlans(PlanCriteria criteria);
	
	Integer getPlansCnt(PlanCriteria criteria);
	
	SearchPagerModel<PlanTO> getPlansPagerModel(PlanCriteria criteria);
}
