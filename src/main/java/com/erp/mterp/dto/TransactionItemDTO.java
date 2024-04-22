package com.erp.mterp.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@AllArgsConstructor
public class TransactionItemDTO {

	
	@JsonProperty("name")
	private String name;
	
	@JsonProperty("rate")
	private double rate;
	
	@JsonProperty("quantity")
	private float quantity;
}
