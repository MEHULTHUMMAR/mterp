package com.erp.mterp.repository.category;

import com.erp.mterp.vo.category.CategoryVo;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

public interface CategoryRepository extends JpaRepository<CategoryVo, Long>, DataTablesRepository<CategoryVo, Long> {

    CategoryVo findByCategoryId(long categoryid);

    @Modifying
    @Query("update CategoryVo set isDeleted=1 where categoryId=?1")
    void deletecategory(long id);

    List<CategoryVo> findByCompanyIdAndCreatedBy(long companyid, long id);

    @Query(value = "select count(1) from category where company_id=?1 and is_deleted=0 and category_name ilike concat('%',?2,'%')",nativeQuery = true)
    int findTotalCategoryRecord(long companyId, String searchValue);

    @Query(value = "select * from category where company_id=?1 and is_deleted=0 and category_name ilike concat('%',?2,'%') limit ?3 offset ?4",nativeQuery = true)
    List<CategoryVo> findcategoryData(long companyId, String searchValue, int length, int offset);

    @Query("from CategoryVo where lower(categoryName)=lower(?1) and companyId=?2 and isDeleted=0 order by categoryId")
    List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchId(String name, long companyId);

    @Query("from CategoryVo where lower(categoryName)=lower(?1) and companyId=?2 and categoryId!=?3 and isDeleted=0 order by categoryId")
    List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchIdAndCategoryIdNot(String upcategoryname, long companyId, long categoryId);

    CategoryVo findByCategoryIdAndCompanyIdAndIsDeleted(long id, long companyId, int i);

    List<CategoryVo> findByCompanyIdAndIsDeleted(long companyId, int i);
}
