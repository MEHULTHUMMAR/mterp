package com.erp.mterp.vo.countries;

import lombok.Data;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "loc_countries", indexes = @Index(name = "countries_code", columnList = "countries_code", unique = true))
public class CountriesVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "countries_id", length = 10)
	private long countriesId;

	@Column(name = "countries_code", length = 20)
	private String countriesCode;

	@Column(name = "countries_name", length = 50)
	private String countriesName;

}
