package com.erp.mterp.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@JsonInclude(Include.NON_NULL)
public class LoyaltyCouponsDTO {

    @JsonProperty(value = "coupon_name")
    private String coupon_name;
    
    @JsonProperty(value = "coupon_code")
    private String coupon_code;
    
    @JsonProperty(value = "coupon_type")
    private String coupon_type;
    
    @JsonProperty(value = "discount_on")
    private String discount_on;
    
    @JsonProperty(value = "discount_type")
    private String discount_type;
    
    @JsonProperty(value = "discount_value")
    private String discount_value;

    @JsonProperty(value = "allow_otp")
    private int allowOtp;

    @JsonProperty(value = "extra_fields")
    private List<LoyaltyExtraFieldsDTO> extra_fields;
    
    
    
}
