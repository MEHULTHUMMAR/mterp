package com.erp.mterp.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@JsonInclude(Include.NON_NULL)
@AllArgsConstructor
public class LoyaltyCouponDataDTO{
	
	 private String message;
	 private double loyalty_points;
	 private boolean allow_otp_for_redemption;
	 //private int points_value;
	 private List<LoyaltyCouponsDTO> coupons;
}
