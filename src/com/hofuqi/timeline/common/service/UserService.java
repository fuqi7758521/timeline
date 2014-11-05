package com.hofuqi.timeline.common.service;

import com.hofuqi.timeline.common.criteria.UserCriteria;
import com.hofuqi.timeline.common.to.UserTO;

public interface UserService {
	
	void add(UserTO to);
	
	UserTO getUserByUsernamAndPassword(String username, String password);
	
	UserTO getUser(UserCriteria criteria);
}
