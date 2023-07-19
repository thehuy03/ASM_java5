package com.tinhocanhtrang.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.tinhocanhtrang.entity.Category;
import com.tinhocanhtrang.entity.Image;
import com.tinhocanhtrang.entity.ImageSave;
import com.tinhocanhtrang.entity.Producer;
import com.tinhocanhtrang.entity.Product;
import com.tinhocanhtrang.entity.Spec;
import com.tinhocanhtrang.repository.CategoryRepository;
import com.tinhocanhtrang.repository.ImageRepository;
import com.tinhocanhtrang.repository.ProducerRepository;
import com.tinhocanhtrang.repository.ProductRepository;
import com.tinhocanhtrang.repository.SpecRepository;
import com.tinhocanhtrang.service.CloudinaryService;

import jakarta.servlet.http.HttpServletResponse;


@Controller
@Transactional
public class ProductController {
	@Autowired
	ProductRepository proDAO;
	@Autowired
	CategoryRepository cateDAO;
	@Autowired
	SpecRepository specDAO;
	@Autowired
	ProducerRepository produDAO;
	@Autowired
	HttpServletResponse response;
	@Autowired
	CloudinaryService cloud;
	@Autowired 
	ImageRepository imgRepo;
	
	
	
	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String getProduct(Model model,@RequestParam("p") Optional<Integer> p,@RequestParam("cate") String cate) {
			Category category= cateDAO.findById(cate).get();
			Pageable pageable = PageRequest.of(p.orElse(0), 18);
			Page<Product> page=proDAO.findbyCategory(cate, pageable);
			model.addAttribute("items",page.getContent());
			model.addAttribute("page",page);
			model.addAttribute("size",page.getContent().size());
		return "product/product";
	}
	@RequestMapping(value = "product/category", method = RequestMethod.GET)
	public String getProduct1(Model model,@RequestParam("p") Optional<Integer> p,@RequestParam("cate") String cate,@RequestParam("pro")String pro) {
			Producer producer=produDAO.findById(pro).get();
			Category category= cateDAO.findById(cate).get();
			Pageable pageable = PageRequest.of(p.orElse(0), 18);
			Page<Product> page=proDAO.findbyCategoryandProducer(cate,pro, pageable);
			model.addAttribute("items",page.getContent());
			model.addAttribute("page",page);
			model.addAttribute("size",page.getContent().size());
		return "product/product";
	}
	@GetMapping(value = "admin/manager-product")
	public String getManagerProduct(Model model,@RequestParam("page") Optional<Integer> p) {
		Pageable pageable = PageRequest.of(p.orElse(0), 6);
		List<Category> cate=cateDAO.findAll();
		List<Spec> specs=specDAO.findAll();
		List<Producer> produ=produDAO.findAll();
		model.addAttribute("producer",produ);
		model.addAttribute("cates",cate);
		model.addAttribute("specList",specs);
		model.addAttribute("listPro",proDAO.findAll(pageable));
		return "Admin/Product";
	}
	@PostMapping(value="admin/manager-product/create")
	public String getHinh(@RequestParam("imgUpload") List<MultipartFile> imgUpload,@RequestParam("specs") List<Integer> spec ,Product product) throws Exception {
		proDAO.save(product);
		for (int i=0;i<imgUpload.size();i++) {
			MultipartFile file=imgUpload.get(i);
	            try {
	            	ImageSave image = new ImageSave();
	                // Gán thông tin từ file MultipartFile cho đối tượng Image
	                image.setFileName(file.getOriginalFilename());
	                image.setFileSize(file.getSize());
	                image.setFileType(file.getContentType());
	                image.setData(file.getBytes());
	                // Thực hiện lưu trữ file
	                // Ví dụ: Lưu file vào thư mục uploads
	                String saveDirectory = "C:/images/";
	        	    
	        	    // Tạo thư mục lưu trữ nếu chưa tồn tại
	        	    File directory = new File(saveDirectory);
	        	    if (!directory.exists()) {
	        	        directory.mkdirs();
	        	    }
	        	    // Lưu trữ file vào ổ đĩa
	        	    String filePath = saveDirectory + image.getFileName();
	        	    try (OutputStream outputStream = new FileOutputStream(filePath)) {
	        	        outputStream.write(image.getData());
	        	    }
	        	    String url;
	                url=cloud.uploadImage(filePath, "public_id",product.getCategory().getCategoryName()+"/"+product.getProductName().replaceAll("\\s", "").substring(0, 16)+"/"+product.getProducer().getProducerName()+"-"+i);
	                Image img=new Image(url,product);
	                imgRepo.save(img);
	            } catch (IOException e) {
	            	e.printStackTrace();
	            }
	    }
		List<Spec> s1=new ArrayList<>();
		for(Integer str:spec) {
			Spec s2=specDAO.findById(str).get();
			s1.add(s2);
		}
		
		product.setSpecs(s1);
		proDAO.save(product);
		return "redirect:/admin/manager-product";
	}
//	@PostMapping(value = "admin/manager-product/create" )
//	public String getManagerProduct1() {
//		
//		return "redirect:/admin/manager-product";
//	}
	@PostMapping(value = "admin/manager-product/check")
	public @ResponseBody boolean getManagerSpec_Check(Product pro) {
		if (proDAO.existsById(pro.getProductId())) {
			return true;
		} else {
			return false;
		}
	}
	@PostMapping("/admin/manager-product/listSpec/{id}")
	public @ResponseBody List<String> findSpecbyId(@PathVariable String id) {
		System.out.println(id);
		Product pro= proDAO.findById(id).get();
		List<Spec> list= pro.getSpecs();
		List<String> list2 =new ArrayList<>();
		for(Spec str:list) {
			list2.add(str.getSpecId().toString());
		}
		System.out.println(list2.size());
		return list2;
	}
	@PostMapping("/admin/manager-product/listImg/{id}")
	public @ResponseBody List<String> findImgbyId(@PathVariable String id,Model model) {
		System.out.println(id);
		Product pro= proDAO.findById(id).get();
		List<Image> list=pro.getImages();
		List<String>list1=new ArrayList<>();
		for(Image str:list) {
			list1.add(str.getImageLink());
		}
		model.addAttribute("image",list);
		System.out.println(list1.size());
		return list1;
	}
}
