package com.erp.mterp.vo.state;

import lombok.Data;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@Table(name = "loc_state", indexes = @Index(name = "state_code", columnList = "state_code", unique = true))
public class StateVo implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "state_id", length = 10)
	private long stateId;

	@Column(name = "state_code", length = 50)
	private String stateCode;

	@Column(name = "state_name", length = 50)
	private String stateName;

	@Column(name = "countries_code", length = 20)
	private String countriesCode;


}
