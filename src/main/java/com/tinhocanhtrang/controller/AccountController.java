package com.tinhocanhtrang.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tinhocanhtrang.entity.Spec;
import com.tinhocanhtrang.entity.User;
import com.tinhocanhtrang.repository.UserRepository;
import com.tinhocanhtrang.service.SecurityService;
import com.tinhocanhtrang.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	SecurityService securityService;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listAccount")
	public Page<User> getAllAccount() {
		Pageable pageable = PageRequest.of(0, 6);
		return userRepository.findByUserNameContainingOrUserEmailContaining("", "", pageable);
	}

	@PostMapping(value = "admin/manager-account/create")
	public String getManagerAccount_Create(User account) {
		account.setUserPhone(securityService.sha256(account.getUserPhone()));
		account.setUserPassword(securityService.encodePassword(account.getUserPassword()));
		userRepository.save(account);
		return "redirect:/admin/manager-account";
	}

	@GetMapping(value = "admin/manager-account")
	public String getManagerAccount() {
		return "Admin/Account";
	}

	@GetMapping(value = "admin/manager-account/search")
	public String getManagerAccount_Search(@RequestParam("search") Optional<String> kw,
			@RequestParam("page") Optional<Integer> p, @RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = kw.orElse(sessionService.get("keywordsAccount"));
		sessionService.set("keywordsAccount", kwords);

		Integer pe = p.orElse(sessionService.get("pageAccount"));
		sessionService.set("pageAccount", pe);
		if (pe == null) {
			pe = 0;
		}

		Boolean sort = s.orElse(sessionService.get("sortAccount"));
		sessionService.set("sortAccount", sort);
		if (sort == null) {
			sort = true;
		}

		String name = n.orElse(sessionService.get("nameAccount"));
		sessionService.set("nameAccount", name);
		if (name == null) {
			name = "userName";
		}

		Pageable pageable = PageRequest.of(pe, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<User> page = userRepository.findByUserNameContainingOrUserEmailContaining((kwords == null ? "" : kwords),
				(kwords == null ? "" : kwords), pageable);
		model.addAttribute("listAccount", page);
		model.addAttribute("searchAccount", kwords);
		return "Admin/Account";
	}

	@PostMapping(value = "admin/manager-account/check")
	public @ResponseBody boolean getManagerAccount_Check(User account) {
		account.setUserPhone(securityService.sha256(account.getUserPhone()));
		if (userRepository.existsByUserPhone(account.getUserPhone())) {
			return true;
		} else {
			return false;
		}
	}
}
