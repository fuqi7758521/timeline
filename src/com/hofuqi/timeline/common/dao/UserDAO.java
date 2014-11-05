package com.hofuqi.timeline.common.dao;

import com.hofuqi.timeline.common.criteria.UserCriteria;
import com.hofuqi.timeline.common.to.UserTO;

public interface UserDAO {
	
	void add(UserTO to);
	
	UserTO getUser(UserCriteria criteria);
	
}
