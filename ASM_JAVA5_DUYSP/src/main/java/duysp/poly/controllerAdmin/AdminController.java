package duysp.poly.controllerAdmin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import duysp.poly.model.Users;
import duysp.poly.repositories.Products_Repo;
import duysp.poly.repositories.Users_Repo;
@Controller
public class AdminController {
	@Autowired
	private Users_Repo userRepository;
	
	@Autowired
	private Products_Repo productRepository;
	
	
	@GetMapping("/admin/home")
	public String helloAdmin(Model m) {
		m.addAttribute("pageCurrent2","helloAdmin.jsp");
		return "indexAdmin";
	}
	
	
	
	
}
