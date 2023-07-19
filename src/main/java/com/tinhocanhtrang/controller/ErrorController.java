package com.tinhocanhtrang.controller;

import org.apache.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.SC_NOT_FOUND) {
				return "Error/error-404";
			} else if (statusCode == HttpStatus.SC_INTERNAL_SERVER_ERROR) {
				return "Error/error-500";
			}
		}
		return "Error/error";
	}
}
