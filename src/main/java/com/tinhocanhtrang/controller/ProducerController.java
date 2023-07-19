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


import com.tinhocanhtrang.entity.Producer;
import com.tinhocanhtrang.repository.ProducerRepository;
import com.tinhocanhtrang.service.SessionService;

@Controller
public class ProducerController {
	@Autowired
	ProducerRepository producerRepository;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listProducer")
	public Page<Producer> getAllProducer() {
		Pageable pageable = PageRequest.of(0, 6);
		return producerRepository.findByProducerNameContainingOrProducerIdContaining("", "", pageable);
	}

	@GetMapping(value = "admin/manager-producer")
	public String getProducer() {
		
		return "Admin/Producer";
	}

	@PostMapping(value = "admin/manager-producer/create")
	public String getManagerProducer_Create(Producer producer) {
		producerRepository.save(producer);
		return "redirect:/admin/manager-producer";
	}

	@PostMapping(value = "admin/manager-producer/delete")
	public String getManagerProducer_Delete(Producer producer) {
		producerRepository.delete(producer);
		return "redirect:/admin/manager-producer";
	}

	@GetMapping(value = "admin/manager-producer/search")
	public String getManagerProducer_Search(@RequestParam("search") Optional<String> kw,
			@RequestParam("page") Optional<Integer> p, @RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = kw.orElse(sessionService.get("keywordsProducer"));
		sessionService.set("keywordsProducer", kwords);

		Integer pe = p.orElse(sessionService.get("pageProducer"));
		sessionService.set("pageProducer", pe);
		if (pe == null) {
			pe = 0;
		}

		Boolean sort = s.orElse(sessionService.get("sortProducer"));
		sessionService.set("sortProducer", sort);
		if (sort == null) {
			sort = true;
		}

		String name = n.orElse(sessionService.get("nameProducer"));
		sessionService.set("nameProducer", name);
		if (name == null) {
			name = "producerId";
		}

		Pageable pageable = PageRequest.of(pe, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<Producer> page = producerRepository.findByProducerNameContainingOrProducerIdContaining(
				(kwords == null ? "" : kwords), (kwords == null ? "" : kwords), pageable);
		model.addAttribute("listProducer", page);
		model.addAttribute("searchProducer", kwords);
		return "Admin/Producer";
	}

	@PostMapping(value = "admin/producer/check")
	public @ResponseBody boolean getCheckProducer(Producer producer) {
		if (producerRepository.existsByProducerId(producer.getProducerId())) {
			return true;
		} else
			return false;
	}
}
