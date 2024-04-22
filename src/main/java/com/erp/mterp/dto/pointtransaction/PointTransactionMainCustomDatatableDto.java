package com.erp.mterp.dto.pointtransaction;

import java.util.List;

import com.erp.mterp.dto.pointledger.PointLedgerDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PointTransactionMainCustomDatatableDto {
	private long totalRecords;
	private int page;
	private int offset;
	private List<PointLedgerDTO> data;

}
