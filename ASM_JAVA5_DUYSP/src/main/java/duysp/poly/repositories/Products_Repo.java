package duysp.poly.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import duysp.poly.model.Products;
import duysp.poly.model.Users;

public interface Products_Repo extends CrudRepository<Products, String>{
	Page<Products> findAll(Pageable pageable);
	
	@Query("SELECT u FROM Products u where u.Available = :stt")
	public List<Products> listByStatus(boolean stt);
	@Query("SELECT u FROM Products u where u.id =:id")
	public int findByidProduct(Long id);
}
