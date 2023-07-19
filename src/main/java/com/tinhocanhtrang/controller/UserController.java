package com.tinhocanhtrang.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tinhocanhtrang.entity.User;
import com.tinhocanhtrang.repository.UserRepository;
import com.tinhocanhtrang.service.SecurityService;
import com.tinhocanhtrang.service.SessionService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class UserController {
	@Autowired
	SessionService sessionService;
	@Autowired
	SecurityService securityService;
	@Autowired
	UserRepository userRepository;
	@Autowired
	HttpServletResponse response;

	@PostMapping(value = "user/register")
	public @ResponseBody User getRegister(User user) throws IOException {
		String phoneNumber = user.getUserPhone();
		String pass = user.getUserPassword();
		user.setUserPhone(securityService.sha256(phoneNumber));
		if (!userRepository.existsByUserPhone(user.getUserPhone())) {
			user.setUserPassword(securityService.encodePassword(user.getUserPassword()));
			userRepository.save(user);
		} else {
			response.sendError(500, "UserPhone exists");
		}
		user.setUserPhone(phoneNumber);
		user.setUserPassword(pass);
		return user;
	}

	@PostMapping(value = "user/login")
	public String getLogin(User user, RedirectAttributes model) {
		User userData = userRepository.findById(securityService.sha256(user.getUserPhone())).orElse(null);
		if (userData != null) {
			if (securityService.matches(user.getUserPassword(), userData.getUserPassword())) {
				sessionService.set("current_account", userData);
				sessionService.setTimeOut(1*24*60*60);
			} else {
				model.addAttribute("userErr", "số điện thoại hoặc mật khẩu không hợp lệ");
				model.addAttribute("userPhone", user.getUserPhone());
				model.addAttribute("userPassword", user.getUserPassword());
			}
		}else {
			model.addAttribute("userErr", "số điện thoại hoặc mật khẩu không hợp lệ");
		}
		return "redirect:/home";
	}

	@GetMapping(value = "user/logout")
	public String getLogout() throws InterruptedException {
		User user =  sessionService.get("current_account");
		user.setBills(null);
		if (user != null) {
			sessionService.setTimeOut(1);
			Thread.sleep(1000);
		}
		return "redirect:/home";
	}
}
