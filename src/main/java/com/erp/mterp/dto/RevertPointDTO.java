package com.erp.mterp.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@AllArgsConstructor
public class RevertPointDTO {

	@JsonProperty("transaction_id")
	private String TransactionId;
	
	@JsonProperty("mobile")
	private String Mobile;	
	
	
	
}
