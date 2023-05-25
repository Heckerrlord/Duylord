package duysp.poly.model;



import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "USERS")
public class Users {
	@Id
	/* (message = "Không để trống tên tài khoản") */
	@Column(name="USERNAME")
	@NotEmpty
	private String Username;
	
	 /* (message = "Không để trống mật khẩu") */
	@Column(name="PASSWORD")
	@NotBlank
	private String Password;
	
	@Column(name="FULLNAME")
	private String Fullname;
	
	@Column(name="PHOTO")
	private String Photo;
	
	@Column(name="EMAIL")
	private String Email;
	
	@Column(name="PHONE")
	private String Phone;
	
	@Column(name="STATUS")
	private int Status;
	
	@Column(name="Role")
	private Boolean role;
	
	
	
	
	
}
