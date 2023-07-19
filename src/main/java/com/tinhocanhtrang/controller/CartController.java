package com.tinhocanhtrang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.service.ShoppingCartService;



@Controller
public class CartController {
	@Autowired
		ShoppingCartService cart;
		
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String getHome() throws Exception {
		return "cart/index";
	}

	@RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		return "cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable(value = "id") String id) {
		cart.add(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}

}
