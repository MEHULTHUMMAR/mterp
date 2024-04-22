package com.erp.mterp.repository.coupon;

import java.util.List;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.erp.mterp.dto.coupon.CouponCustomDatatableDTO;
import com.erp.mterp.vo.coupon.CouponVo;

public interface CouponRepository extends JpaRepository<CouponVo, Long>, DataTablesRepository<CouponVo, Long> {

	CouponVo findByCouponIdAndCompanyId(long id, long companyId);

	@Query("from CouponVo where companyId=?2 and points<=?1 and isDeleted=0")
	List<CouponVo> findByCoponPointAndCompanyId(double points, long companyId);

	@Query(nativeQuery = true, value = "SELECT\n"
			+ "	count(coupon_id)\n"
			+ "FROM\n"
			+ "	coupon \n"
			+ "WHERE\n"
			+ "	case when :searchValue='' then 1=1 else \n"
			+ "	(LOWER(coupoun_type) like lower(concat('%',:searchValue,'%')) \n"
			+ "	or LOWER(description) like lower(concat('%',:searchValue,'%'))) end\n"
			+ "	AND company_id = :companyId \n"
			+ "	AND is_deleted = :isDeleted")
	Integer countOfCouponVoDatatable(@Param("searchValue") String searchValue, @Param("companyId") long companyId,
			@Param("isDeleted") int isDeleted);

	@Query(nativeQuery = true, value = "SELECT\n"
			+ "	coupon_id as couponId,\n"
			+ "	COALESCE(coupoun_type,'') as couponType,\n"
			+ "	COALESCE(points,0) as points\n"
			+ "FROM\n"
			+ "	coupon \n"
			+ "WHERE\n"
			+ "	case when :searchValue='' then 1=1 else \n"
			+ "	(LOWER(coupoun_type) like lower(concat('%',:searchValue,'%')) \n"
			+ "	or LOWER(description) like lower(concat('%',:searchValue,'%'))) end\n"
			+ "	AND company_id = :companyId \n"
			+ "	AND is_deleted = :isDeleted\n"
			+ "	order by coupon_id desc limit :length offset :offset")
	List<CouponCustomDatatableDTO> getCouponVoCustomDatatableBy(@Param("searchValue") String searchValue,
			@Param("companyId") long companyId, @Param("isDeleted") int isDeleted, @Param("length") int length,
			@Param("offset") int offset);

}
