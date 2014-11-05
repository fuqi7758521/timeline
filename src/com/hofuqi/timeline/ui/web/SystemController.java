package com.hofuqi.timeline.ui.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hofuqi.timeline.common.Constants;
import com.hofuqi.timeline.common.criteria.UserCriteria;
import com.hofuqi.timeline.common.service.UserService;
import com.hofuqi.timeline.common.to.UserTO;
import com.hofuqi.timeline.common.util.AcsUtil;
import com.hofuqi.timeline.common.util.MessageDigestUtil;
import com.hofuqi.timeline.common.util.RequestUtil;

/**
 * 系统相关，登录、注册
 * @author fuqi
 * @date 2014-10-12
 */
@Controller
public class SystemController {
	
	@Autowired
	private UserService userService;
	
	//登录页面
	public static final String LOGIN_PAGE = "/WEB-INF/pages/login.jsp";
	
	//注册页面
	public static final String SIGNUP_PAGE = "/WEB-INF/pages/signup.jsp";
	
	//进入登录页面
	@RequestMapping("login.html")
	public ModelAndView goLogin(HttpServletRequest request){
		request.setAttribute("method", "login");
		return new ModelAndView(LOGIN_PAGE);
	}
	
	//登录
	@RequestMapping("doLogin.html")
	public ModelAndView doLogin(HttpServletRequest request){
		String username = RequestUtil.getString(request, "username");
		String password = RequestUtil.getString(request, "password");
		String encryPassword = MessageDigestUtil.getMD5(password + Constants.PASSWORD_SALT_KEY);
		UserTO user = userService.getUserByUsernamAndPassword(username, encryPassword);
		if(user != null && user.getStatus().equals(Constants.STATUS_NORMAL)){
			AcsUtil.addLoginUserToSession(request, user);
			return new ModelAndView("redirect:plans.html");
		}else{
			request.setAttribute("msg", "用户名或密码不正确！");
			return new ModelAndView(LOGIN_PAGE);
		}
	}
	
	//退出
	@RequestMapping("logout.html")
	public ModelAndView doLogout(HttpServletRequest request){
		AcsUtil.removeLoginUserFromSession(request);
		return new ModelAndView("redirect:");
	}
	
	
	//进入注册页面
	@RequestMapping("signup.html")
	public ModelAndView goSignup(HttpServletRequest request){
		request.setAttribute("method", "signup");
		return new ModelAndView(SIGNUP_PAGE);
	}
	
	//注册
	@RequestMapping("doSignup.html")
	public ModelAndView doSignup(HttpServletRequest request){
		String username = RequestUtil.getString(request, "username");
		String password = RequestUtil.getString(request, "password");
		String encryPassword = MessageDigestUtil.getMD5(password + Constants.PASSWORD_SALT_KEY);
		
		UserCriteria criteria = new UserCriteria();
		criteria.setUsername(username);
		UserTO tempUser = userService.getUser(criteria);
		if(tempUser != null){
			request.setAttribute("msg", "该用户已经存在!");
			return new ModelAndView(SIGNUP_PAGE);
		}
		
		UserTO to = new UserTO();
		to.setUsername(username);
		to.setPassword(encryPassword);
		userService.add(to);
		AcsUtil.reAddLoginUserToSession(request, String.valueOf(to.getId()), userService);
		return new ModelAndView("redirect:plans.html"); 
	}
}
