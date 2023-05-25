package duysp.poly.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import duysp.poly.model.Users;

public interface Users_Repo extends CrudRepository<Users, String>{
	
	@Query("SELECT u FROM Users u where u.Username = :taikhoan and u.Password = :matkhau")
	public Users checkPass(String taikhoan, String matkhau);
	
	@Query("SELECT u FROM Users u where u.Status = :stt and u.role = false")
	public List<Users> listByStatus(int stt);

}
