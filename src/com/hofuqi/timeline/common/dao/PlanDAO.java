package com.hofuqi.timeline.common.dao;

import java.util.List;

import com.hofuqi.timeline.common.criteria.PlanCriteria;
import com.hofuqi.timeline.common.to.PlanTO;

public interface PlanDAO {
	
	void add(PlanTO to);
	
	void update(PlanTO to);
	
	void delete(Long id);
	
	PlanTO getPlan(PlanCriteria criteria);
	
	PlanTO getPlanById(Long id);
	
	List<PlanTO> getPlans(PlanCriteria criteria);
	
	Integer getPlansCnt(PlanCriteria criteria);

	
}
