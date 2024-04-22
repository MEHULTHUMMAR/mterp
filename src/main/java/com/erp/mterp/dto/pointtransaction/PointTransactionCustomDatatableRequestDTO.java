package com.erp.mterp.dto.pointtransaction;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PointTransactionCustomDatatableRequestDTO {
	private String serachValue;
	private int length;
    private int start;
    private String draw;
    private String mobileno;
}
