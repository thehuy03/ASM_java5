package com.tinhocanhtrang.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import com.tinhocanhtrang.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute("current_account");
		if(user != null && user.isUserRole()) {
			return true;
		}else {
			response.sendRedirect("/home");
			return false;
		}
		
	}
}
