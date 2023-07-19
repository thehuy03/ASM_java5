package com.tinhocanhtrang.controller;

import java.io.IOException;
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

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.entity.Spec;
import com.tinhocanhtrang.repository.SpecRepository;
import com.tinhocanhtrang.service.SessionService;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SpecController {
	@Autowired
	SpecRepository specRepository;
	@Autowired
	HttpServletResponse response;
	@Autowired
	SessionService sessionService;

	@ModelAttribute("listSpec")
	public Page<Spec> getAllSpec() {
		Pageable pageable = PageRequest.of(0, 6);
		return specRepository.findBySpecKeyContainingOrSpecValueContaining("", "", pageable);
	}

	@GetMapping(value = "admin/manager-spec")
	public String getSpec() {
		return "Admin/Spec";
	}

	@PostMapping(value = "admin/manager-spec/create")
	public String getManagerSpec_Create(Spec spec) {
		specRepository.save(spec);
		return "redirect:/admin/manager-spec";
	}

	@PostMapping(value = "admin/manager-spec/delete")
	public String getManagerspec_Delete(Spec spec) throws IOException {
		Spec specData = specRepository.findBySpecKeyAndSpecValue(spec.getSpecKey(), spec.getSpecValue());
		if (specData != null && specData.getProducts().size() > 0) {
			response.sendError(500);
		} else if (specData != null && specData.getProducts().size() == 0) {
			specRepository.delete(specData);
		}
		return "redirect:/admin/manager-spec";
	}

	@GetMapping(value = "admin/manager-spec/search")
	public String getManagerSpec_Search(@RequestParam("search") Optional<String> kw,
			@RequestParam("page") Optional<Integer> p, @RequestParam("name") Optional<String> n,
			@RequestParam("sort") Optional<Boolean> s, Model model) {
		String kwords = kw.orElse(sessionService.get("keywordsSpec"));
		sessionService.set("keywordsSpec", kwords);

		Integer pe = p.orElse(sessionService.get("pageSpec"));
		sessionService.set("pageSpec", pe);
		if (pe == null) {
			pe = 0;
		}

		Boolean sort = s.orElse(sessionService.get("sort"));
		sessionService.set("sortSpec", sort);
		if (sort == null) {
			sort = true;
		}

		String name = n.orElse(sessionService.get("nameSpec"));
		sessionService.set("nameSpec", name);
		if (name == null) {
			name = "specId";
		}

		Pageable pageable = PageRequest.of(pe, 6, sort ? Direction.ASC : Direction.DESC, name);
		Page<Spec> page = specRepository.findBySpecKeyContainingOrSpecValueContaining((kwords == null ? "" : kwords),
				(kwords == null ? "" : kwords), pageable);
		model.addAttribute("listSpec", page);
		model.addAttribute("searchSpec", kwords);
		return "Admin/Spec";
	}

	@PostMapping(value = "admin/manager-spec/check")
	public @ResponseBody boolean getManagerSpec_Check(Spec spec) {
		if (specRepository.existsBySpecIdOrSpecKeyLikeAndSpecValueLike(spec.getSpecId(), spec.getSpecKey(),
				spec.getSpecValue())) {
			return true;
		} else {
			return false;
		}
	}
}
