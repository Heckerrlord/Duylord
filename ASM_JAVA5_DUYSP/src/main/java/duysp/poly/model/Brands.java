package duysp.poly.model;


import java.util.List;



import jakarta.persistence.*;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Data
@Entity
@Table(name="BRANDS")
public class Brands {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Id")
	private String Id;
	
	@Column(name="NAME")
	private String Name;
	@OneToMany(mappedBy = "Brands")
	List<Products> Products;
	

	
}

