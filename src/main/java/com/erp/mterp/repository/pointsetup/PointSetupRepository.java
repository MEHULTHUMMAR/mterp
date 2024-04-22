package com.erp.mterp.repository.pointsetup;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.erp.mterp.vo.pointSetup.PointSetupVo;

public interface PointSetupRepository extends JpaRepository<PointSetupVo, Long>, DataTablesRepository<PointSetupVo, Long> {

//	@Query("from PointSetupVo where companyId=?1 and isDeleted=0")
//	PointSetupVo findByCompanyId(long companyId);

	@Query(value="select * from point_setup where company_id=?1 and is_deleted=0 limit 1", nativeQuery = true)
	PointSetupVo findByCompanyId(long companyId);

	

}

