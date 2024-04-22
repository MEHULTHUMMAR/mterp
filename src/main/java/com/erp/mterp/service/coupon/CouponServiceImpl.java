package com.erp.mterp.service.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.mterp.dto.coupon.CouponCustomDatatableDTO;
import com.erp.mterp.repository.coupon.CouponRepository;
import com.erp.mterp.vo.coupon.CouponVo;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	CouponRepository couponRepository;
	
	@Override
	public void save(CouponVo couponVo) {
		couponRepository.save(couponVo);
	}

	@Override
	public CouponVo findByCouponIdAndCompanyId(long id, long companyId) {
		// TODO Auto-generated method stub
		return couponRepository.findByCouponIdAndCompanyId(id,companyId);
	}

	@Override
	public List<CouponVo> findByCoponPointAndCompanyId(double points, long companyId) {
		// TODO Auto-generated method stub
		return couponRepository.findByCoponPointAndCompanyId(points,companyId);
	}

	@Override
	public Integer countOfCouponVoDatatable(String searchValue, long companyId, int isDeleted) {
		return couponRepository.countOfCouponVoDatatable(searchValue, companyId, isDeleted);
	}

	@Override
	public List<CouponCustomDatatableDTO> getCouponVoCustomDatatableBy(String searchValue, long companyId,
			int isDeleted, int length, int offset) {
		return couponRepository.getCouponVoCustomDatatableBy(searchValue, companyId,
				isDeleted, length, offset);
	}

}
