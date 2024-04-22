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
public class TransactionDTO {

	@JsonProperty("id")
	private String id;
	
	@JsonProperty("bill_no")
	private String billNo;	
	
	@JsonProperty("gross_amount")
	private String grossAmount;
	
	@JsonProperty("net_amount")
	private String netAmount;
	
	@JsonProperty("items")
	private List<TransactionItemDTO> items;
	
}
