package com.erp.mterp.dto.pointledger;

import java.util.Date;

public interface PointLedgerDTO {

	public long getPointTransactionId();

	public Date getCreatedOn();

	public String getBillNo();

	public double getInPoint();

	public double getOutPoint();

	public String getDescription();

	public long getCouponId();

	public String getCoupounType();

}
