package com.erp.mterp.vo.commonResponse;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
@AllArgsConstructor
@NoArgsConstructor
public class ApiResponseForCustomerLedger {

    private static final long serialVersionUID = 1L;

    @JsonProperty(value = "status")
    private boolean status;
    
    @JsonProperty(value = "code")
    private String code;

    @JsonProperty(value = "message")
    private String message;


}
