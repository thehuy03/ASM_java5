package com.tinhocanhtrang.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tinhocanhtrang.DAO.ImageDAO;
import com.tinhocanhtrang.entity.Image;
import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.repository.ProductRepository;

@Controller
public class DetailController {
	@Autowired
	ProductRepository proDAO;
	@Autowired 
	ImageDAO imgDao;
	@RequestMapping(value = "product/detail", method = RequestMethod.GET)
	public String getDetailProduct(Model model,@RequestParam("id") String id) {
		List<Image> img=imgDao.findByIdproduct(id);
		Optional<Product> product=proDAO.findById(id);
		Product pro=product.get();
		model.addAttribute("pro",pro);
		model.addAttribute("image",pro.getImages());
		model.addAttribute("spec",pro.getSpecs());
		List<Product> list=proDAO.findProductRelate(pro.getCategory().getCategoryId(), pro.getProducer().getProducerId());
		Iterator<Product> iterator = list.iterator();
		while (iterator.hasNext()) {
		    Product pd = iterator.next();
		    if (pd.getProductId().equals(pro.getProductId())) {
		        iterator.remove();
		    }
		}
		model.addAttribute("product_relate",list);
		return "product/detail_product";
	}
}
