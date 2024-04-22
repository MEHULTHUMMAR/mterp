package com.erp.mterp.service.coupon;

import java.util.List;

import com.erp.mterp.dto.coupon.CouponCustomDatatableDTO;
import com.erp.mterp.vo.coupon.CouponVo;

public interface CouponService {

	void save(CouponVo couponVo);

	CouponVo findByCouponIdAndCompanyId(long id, long companyId);

	List<CouponVo> findByCoponPointAndCompanyId(double points, long companyId);

	Integer countOfCouponVoDatatable(String serachValue, long companyId, int i);

	List<CouponCustomDatatableDTO> getCouponVoCustomDatatableBy(String searchValue, long companyId, int isDeleted,
			int length, int offset);

}
