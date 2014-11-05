package com.hofuqi.timeline.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hofuqi.timeline.common.criteria.PlanCriteria;
import com.hofuqi.timeline.common.criteria.SearchPagerModel;
import com.hofuqi.timeline.common.dao.PlanDAO;
import com.hofuqi.timeline.common.service.PlanService;
import com.hofuqi.timeline.common.to.PlanTO;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private PlanDAO planDAO;
	
	@Override
	public void add(PlanTO to) {
		planDAO.add(to);
	}

	@Override
	public PlanTO getPlan(PlanCriteria criteria) {
		return planDAO.getPlan(criteria);
	}

	@Override
	public void update(PlanTO to) {
		planDAO.update(to);
	}

	@Override
	public void delete(Long id) {
		planDAO.delete(id);
	}

	@Override
	public List<PlanTO> getPlans(PlanCriteria criteria) {
		return planDAO.getPlans(criteria);
	}

	@Override
	public Integer getPlansCnt(PlanCriteria criteria) {
		return planDAO.getPlansCnt(criteria);
	}

	@Override
	public SearchPagerModel<PlanTO> getPlansPagerModel(PlanCriteria criteria) {
		SearchPagerModel<PlanTO> pager = criteria.getPageModel();
		if(pager == null){
			pager = new SearchPagerModel<PlanTO>();
		}
		Integer count = planDAO.getPlansCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<PlanTO> result = planDAO.getPlans(criteria);
			pager.setResultList(result);
			pager.setTotal(count);
		}
		return pager;
	}

	@Override
	public PlanTO getPlan(Long id) {
		return planDAO.getPlanById(id);
	}

}
