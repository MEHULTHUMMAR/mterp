package com.erp.mterp.dto.pointtransaction;

import java.util.Date;

public interface PointTransactionCustomDatatableDTO {
	
	public Date getCreatedOn();

	public String getBillNo();

	public double getInPoint();

	public double getOutPoint();

	public String getDescription();

}
