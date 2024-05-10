package com.erp.mterp.service.category;

import com.erp.mterp.vo.category.CategoryVo;
import org.springframework.security.core.Authentication;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

public interface CategoryService {

    Iterable<CategoryVo> findAll();
    

    CategoryVo save(CategoryVo cat);

    CategoryVo findByCategoryId(long categoryid);

    void delete(long id, long companyId);

//    List<CategoryVo> findByCompanyId(long companyId, long merchantTypeId, String clusterId);
    

//    CategoryVo findByCategoryNameAndCompanyId(String trim, long parseLong);


    int findTotalCategoryRecord(long companyId, String searchValue);

    List<CategoryVo>  findcategoryData(long companyId, String searchValue, int length, int offset);

    List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchId(String name, long companyId);

    List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchIdAndCategoryIdNot(String upcategoryname, long companyId, long categoryId);

    CategoryVo findByCategoryIdAndCompanyIdAndIsDeleted(long id, long companyId, int i);

    List<CategoryVo> findByCompanyIdAndIsDeleted(long companyId, int i);
}
