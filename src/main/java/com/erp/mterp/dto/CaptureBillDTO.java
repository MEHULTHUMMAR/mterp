package com.erp.mterp.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;


@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@AllArgsConstructor
public class CaptureBillDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    
    @JsonProperty("customer")
    private CustomerDTO customer;
    
    @JsonProperty("transaction")
    private TransactionDTO transaction;
    
    @JsonProperty("redemption")
    private LoyaltyRedemptionDTO redemption;
   


}
