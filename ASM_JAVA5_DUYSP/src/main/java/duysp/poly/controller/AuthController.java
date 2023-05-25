package duysp.poly.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import duysp.poly.constant.SessionLG;
import duysp.poly.model.Users;
import duysp.poly.repositories.Users_Repo;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AuthController {

	@Autowired
	HttpSession session;
	@Autowired
	private Users_Repo userRepository;
	static List<Users> list = new ArrayList<>();

	@GetMapping("/login")
	public String showLoginForm(Model m) {
		m.addAttribute("user", new Users());
		return "/login";
	}

	@GetMapping({ "*/logout", "/logout" })
	public String logout(Model m) {
		session.removeAttribute(SessionLG.CURRENT_USER);
		return "redirect:/login";
	}

	@PostMapping("/login")
	public String checkLoginForm(Model m, @Validated @ModelAttribute("user") Users user, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(user.getUsername() + "Duy nè ae");
			return "/login";
		}
		// login sucess
		Users u = userRepository.checkPass(user.getUsername(), user.getPassword());
		if (u != null) {
			session.setAttribute(SessionLG.CURRENT_USER, u);
			session.setAttribute("CURRENT_USER", user);
			return "redirect:index";
		}

		// login fail
		m.addAttribute("mes", "User or password wrong");
		return "/login";
	}

	@GetMapping("/signup")
	public String showSignupForm(Model m) {
		m.addAttribute("user", new Users());
		return "/signup";
	}

	@PostMapping("/signup")
	public String createAccount(Model m, @ModelAttribute("user") Users user,@RequestParam String password2) {
		// validate
		try {
			Optional<Users> optionalUser = userRepository.findById(user.getUsername());
			Users u = optionalUser.orElse(null);
			if (u != null) {
				System.out.println("User đã tồn tại");
				m.addAttribute("mess", "Username already exists, please try again");
				return "/signup";
			} else {
				if(user.getPassword().equals(password2)) {
				user.setRole(false);
				user.setStatus(0);
				userRepository.save(user);
				System.out.println("Thành công");
				m.addAttribute("mess", "Sign Up Success");
				}else {
					System.out.println("Fail");
					m.addAttribute("mess", "Password 1 and 2 are not the same");
				}
				return "/signup";
			}
		} catch (Exception e) {
			return "/signup";
		}
	}

	@GetMapping(value = { "/account*", "account/update" })
	public String editAccount(@RequestParam String id, Model m) {
		m.addAttribute("users", userRepository.findById(id).orElse(null));
		m.addAttribute("pageCurrent", "pages/editAccout.jsp");
		return "index";
	}

	@Value("${upload.path}")
	private String pathFolder;

	@PostMapping(value = "account/update")
	public String updateAccount(@RequestParam String username, Model m, @ModelAttribute("users") Users user,
			@RequestParam("file") MultipartFile file) {
		try {
			user.setStatus(0);

			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(pathFolder + file.getOriginalFilename());
				Files.write(path, bytes);
				user.setPhoto(file.getOriginalFilename());
			} else {
				user.setPhoto(user.getPhoto());
			}

			userRepository.save(user);
			session.setAttribute(SessionLG.CURRENT_USER, user);
			session.setAttribute("CURRENT_USER", user);
			m.addAttribute("pageCurrent", "pages/editAccout.jsp");
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return "null";
		}
	}
}
