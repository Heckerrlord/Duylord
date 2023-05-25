package duysp.poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import duysp.poly.model.Products;
import duysp.poly.repositories.Products_Repo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class HomeController {
	@Autowired
	HttpServletRequest rq;
	@Autowired
	HttpServletResponse rspn;

	@Autowired
	private Products_Repo productRepository;

	@GetMapping({ "/index", "/product" })
	public String productPage(Model model,
			@RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(name = "pageSize", required = false, defaultValue = "4") Integer pageSize) {

		Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		Page<Products> page = productRepository.findAll(pageable);
		model.addAttribute("totalPage", page.getTotalPages());
		model.addAttribute("products", page.getContent());
		model.addAttribute("pageCurrent", "pages/home.jsp");
		return "index";
	}

	@GetMapping("/detail*")
	public String detailPage(@RequestParam String id, Model model) {
		model.addAttribute("product", productRepository.findById(id).orElse(null));
		model.addAttribute("pageCurrent", "pages/detail.jsp");
		return "index";
	}
	
	

}
