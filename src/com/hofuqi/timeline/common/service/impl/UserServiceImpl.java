package com.hofuqi.timeline.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hofuqi.timeline.common.criteria.UserCriteria;
import com.hofuqi.timeline.common.dao.UserDAO;
import com.hofuqi.timeline.common.service.UserService;
import com.hofuqi.timeline.common.to.UserTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void add(UserTO to) {
		userDAO.add(to);
	}

	@Override
	public UserTO getUserByUsernamAndPassword(String username, String password) {
		UserCriteria criteria = new UserCriteria();
		criteria.setPassword(password);
		criteria.setUsername(username);
		return this.getUser(criteria);
	}

	@Override
	public UserTO getUser(UserCriteria criteria) {
		return userDAO.getUser(criteria);
	}

}
