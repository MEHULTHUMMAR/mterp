package com.erp.mterp.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoyaltySendOtpBillDTO {

    @JsonProperty(value = "merchant_id")
    private String merchantId;
    
    @JsonProperty(value = "customer_key")
    private String customerKey;
    
    @JsonProperty(value = "points")
    private int points;
    
    @JsonProperty(value = "customer_mobile")
    private String customer_mobile;
  
}
