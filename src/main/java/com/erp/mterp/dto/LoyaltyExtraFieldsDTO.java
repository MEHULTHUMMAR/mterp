package com.erp.mterp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class LoyaltyExtraFieldsDTO {

    @JsonProperty(value = "name")
    private String name;
    
    @JsonProperty(value = "value")
    private String value;

  
}
