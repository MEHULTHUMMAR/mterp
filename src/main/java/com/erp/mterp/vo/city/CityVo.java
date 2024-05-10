package com.erp.mterp.vo.city;

import lombok.Data;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "loc_city", indexes = @Index(name = "city_code", columnList = "city_code", unique = true))
public class CityVo implements Serializable{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "city_id", length = 10)
    private long cityId;

    @Column(name = "city_code", length = 20)
    private String cityCode;

    @Column(name = "city_name", length = 50)
    private String cityName;

    @Column(name = "state_code", length = 20)
    private String stateCode;

    @Column(name = "countries_code", length = 20)
    private String countriesCode;

}
