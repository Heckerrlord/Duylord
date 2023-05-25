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
import duysp.poly.repositories.Users_Repo;

@Controller
public class Users_adminController {
	@Autowired
	private Users_Repo userRepository;
	
	@GetMapping(value = { "/admin/user", "/admin/user/create" })
	public String userCRUD(Model m) {
		list(m);
		m.addAttribute("users", new Users());
		m.addAttribute("pageCurrent2", "crudAmin.jsp");
		return "indexAdmin";
	}

	public void list(Model m) {
		List<Users> list = (List<Users>) userRepository.listByStatus(0);
		List<Users> list2 = (List<Users>) userRepository.listByStatus(1);
		m.addAttribute("list", list);
		m.addAttribute("list2", list2);
		
	}

	@PostMapping("/admin/user/create")
	public String createUser(Model model, @ModelAttribute("users") Users user) {
		userRepository.save(user);
		list(model);
		return "redirect:/admin/user";
	}

	@PostMapping("/admin/user/update")
	public String updateUser(Model model, @ModelAttribute("users") Users user) {
		user.setRole(false);
		userRepository.save(user);
		list(model);
		return "redirect:/admin/user";
	}

	@GetMapping("/admin/user/delete*")
	public String delete(Model model, @RequestParam("id") Users u) {
		u.setStatus(1);
		u.setRole(false);
		userRepository.save(u);
//		userRepository.delete(u);
		list(model);
		return "redirect:/admin/user";
	}
	@GetMapping("/admin/user/unban*")
	public String unban(Model model, @RequestParam("id") Users u) {
		u.setStatus(0);
		u.setRole(false);
		userRepository.save(u);
//		userRepository.delete(u);
		list(model);
		return "redirect:/admin/user";
	}

	@GetMapping("/admin/user/edit*")
	public String edit(Model model, @RequestParam("id") Users u) {
		model.addAttribute("users", u);
		list(model);
		model.addAttribute("pageCurrent2", "crudAmin.jsp");
		return "indexAdmin";
	}
}
