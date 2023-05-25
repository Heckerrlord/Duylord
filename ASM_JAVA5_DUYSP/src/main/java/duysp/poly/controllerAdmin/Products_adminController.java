package duysp.poly.controllerAdmin;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import duysp.poly.model.Brands;
import duysp.poly.model.Products;
import duysp.poly.model.Users;
import duysp.poly.repositories.Brands_Repo;
import duysp.poly.repositories.Products_Repo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class Products_adminController {
	@Autowired
	private Products_Repo productRepository;
	@Autowired
	private Brands_Repo brandsRepository;
	@Autowired
	HttpServletRequest request;

	@Value("${upload.path}")
	private String pathFolder;

	@GetMapping({ "/admin/product", "/admin/product/create" })
	public String goCRUDProducts(Model m) {
		currentPages(m);
		m.addAttribute("products", new Products());
		m.addAttribute("pageCurrent2", "crudProducts.jsp");
		return "indexAdmin";
	}

	@PostMapping("/admin/product")
	public String postCRUDProducts(Model m) {
		currentPages(m);
		m.addAttribute("products", new Products());
		m.addAttribute("pageCurrent2", "crudProducts.jsp");
		return "indexAdmin";
	}

	public void currentPages(Model m) {
		List<Products> list = productRepository.listByStatus(true);
		List<Products> list2 = productRepository.listByStatus(false);
		List<Brands> listB = (List<Brands>) brandsRepository.findAll();
		m.addAttribute("brandsName", listB);
		m.addAttribute("list", list);
		m.addAttribute("pageCurrent2", "crudProducts.jsp");
		m.addAttribute("list2", list2);

	}

	@PostMapping("/admin/product/create")
	public String createProduct(Model m, @Valid @ModelAttribute("Products") Products product,
			@RequestParam("thuonghieu") Brands brands, @RequestParam("file") MultipartFile file, BindingResult result) {
		try {
			if (result.hasFieldErrors()) {
				m.addAttribute("pageCurrent2", "crudProducts.jsp");
				return "indexAdmin";
			}
			if (product != null) {
				LocalDate localDate = LocalDate.now();
				Date currentDate = Date.valueOf(localDate);

				if (!file.isEmpty()) {
					byte[] bytes = file.getBytes();
					Path path = Paths.get(pathFolder + file.getOriginalFilename());
					Files.write(path, bytes);
					product.setImage(file.getOriginalFilename());
				} else {
					product.setImage(product.getImage());
				}
				System.out.println(product.getImage() + "hahahhahah");
				product.setBrands(brands);
				product.setCreateDate(currentDate);
				m.addAttribute("products", new Products());
				productRepository.save(product);
				currentPages(m);
				return "redirect:/admin/product";
			}
			currentPages(m);
			return "indexAdmin";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}

	@PostMapping("/admin/product/update")
	public String updateProduct(Model m, @RequestParam("id") Products product,
			@RequestParam("thuonghieu") Brands brands, @RequestParam("file") MultipartFile file) {
		try {
			LocalDate localDate = LocalDate.now();
			Date currentDate = Date.valueOf(localDate);
			if (!file.isEmpty()) {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(pathFolder + file.getOriginalFilename());
				Files.write(path, bytes);
				product.setImage(file.getOriginalFilename());
			} else {
				product.setImage(product.getImage());
			}
			product.setBrands(brands);
			product.setCreateDate(currentDate);
			m.addAttribute("products", new Products());
			productRepository.save(product);
			currentPages(m);
			return "redirect:/admin/product";
		} catch (Exception e) {
			return "redirect:/admin/product";
		}
	}

	@GetMapping("/admin/product/unavailable*")
	public String delete(Model m, @RequestParam("id") Products product) {
		product.setAvailable(false);
		productRepository.save(product);
//		productRepository.delete(product);
		currentPages(m);
		return "redirect:/admin/product";
	}

	@GetMapping("/admin/product/available*")
	public String available(Model m, @RequestParam("id") Products product) {
		product.setAvailable(true);
		productRepository.save(product);
//		productRepository.delete(product);
		currentPages(m);
		return "redirect:/admin/product";
	}

	@GetMapping("/admin/product/edit*")
	public String edit(Model m, @RequestParam("id") Products product) {
		m.addAttribute("products", product);
		currentPages(m);

		return "indexAdmin";
	}

}
