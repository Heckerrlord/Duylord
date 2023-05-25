package duysp.poly.model;



import java.sql.Date;
import java.util.List;
import java.util.UUID;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name="PRODUCTS")
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private long id;
	

	@Column(name="PRODUCTNAME")
	@NotBlank(message = "Khong de trong ten")
	private String Name;
	
	@Column(name="IMAGE")
	private String Image;
	
	@Column(name="PRICE")
	private double Price;
	
	@Column(name="INFO")
	private String Info;
	
	@Column(name="CREATEDATE")
	private Date CreateDate;
	
	@Column(name="AVAILABLE")
	private Boolean Available;
	
	@ManyToOne
	@JoinColumn(name="BRANDSID")
	Brands Brands;
}
