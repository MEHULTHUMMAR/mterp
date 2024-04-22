package com.erp.mterp.vo.commonResponse;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
public class PointsDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @JsonProperty(value = "loyalty_points")
    private double loyaltyPoints;
	public PointsDetails(double loyaltyPoints) {
		super();
		this.loyaltyPoints = loyaltyPoints;
	}
}
