package duysp.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import duysp.poly.repositories.Products_Repo;
@Controller
public class ProductController {
	@Autowired
	private Products_Repo productRepository;
	
	
	
	
}
