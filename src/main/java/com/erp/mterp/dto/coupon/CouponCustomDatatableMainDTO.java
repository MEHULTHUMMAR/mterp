package com.erp.mterp.dto.coupon;

import java.util.List;

import com.erp.mterp.dto.datatable.DataTableResponceDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponCustomDatatableMainDTO extends DataTableResponceDTO {

	private long totalRecords;

	private List<CouponCustomDatatableDTO> data;
}
