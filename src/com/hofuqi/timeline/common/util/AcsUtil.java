package com.hofuqi.timeline.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hofuqi.timeline.common.criteria.UserCriteria;
import com.hofuqi.timeline.common.service.UserService;
import com.hofuqi.timeline.common.to.UserTO;

public class AcsUtil {
	
	private static int SESSION_MAX_INACTIVE_INTERVAL = 60 * 60 * 24;
	
	public static UserTO getLoginUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		UserTO user = (UserTO) session.getAttribute("user");
		return user;
	}
	
	//把登录用放入session
	public static void addLoginUserToSession(HttpServletRequest request, UserTO user){
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(SESSION_MAX_INACTIVE_INTERVAL);
		session.setAttribute("user", user);
	}
	
	//把登录用放入session
	public static void reAddLoginUserToSession(HttpServletRequest request, String userId, UserService userService) {
		UserCriteria criteria = new UserCriteria();
		criteria.setId(Long.valueOf(userId));
		UserTO user = userService.getUser(criteria);
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(SESSION_MAX_INACTIVE_INTERVAL);
		session.setAttribute("user", user);
	}
	
	public static void removeLoginUserFromSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
	}
}
