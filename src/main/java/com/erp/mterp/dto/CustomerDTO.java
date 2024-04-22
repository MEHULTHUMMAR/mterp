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
public class CustomerDTO {

    @JsonProperty("name")
    private String name;
    
    @JsonProperty("mobile")	
    private String mobile;	
    
    @JsonProperty("dob")
    private String dob;
    
    @JsonProperty("anniversary_date")
    private String anniversaryDate;
    
    @JsonProperty("email")
    private String email;
}