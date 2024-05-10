package com.erp.mterp.service.category;

import com.erp.mterp.repository.category.CategoryRepository;
import com.erp.mterp.vo.category.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {


	@Autowired
	CategoryRepository categoryRepository;
	@Override
	public Iterable<CategoryVo> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CategoryVo save(CategoryVo cat) {
		// TODO Auto-generated method stub
		return categoryRepository.save(cat);
	}

	@Override
	public CategoryVo findByCategoryId(long categoryid) {
		// TODO Auto-generated method stub
		return categoryRepository.findByCategoryId(categoryid);
	}

	@Override
	@CacheEvict(value="Category",allEntries=true)
	public void delete(long id, long companyId) {
		// TODO Auto-generated method stub
		  categoryRepository.deletecategory(id);
	}

//	@Override
//	public List<CategoryVo> findByCompanyId(long companyId, long merchantTypeId, String clusterId) {
//		// TODO Auto-generated method stub
//		return categoryRepository.findByCompanyIdAndIsDeletedOrderByCategoryIdDesc(companyId, 0, merchantTypeId,
//				clusterId);
//	}


//	@Override
//	public CategoryVo findByCategoryNameAndCompanyId(String categoryName, long companyId) {
//		// TODO Auto-generated method stub
//		return categoryRepository.findByCategoryNameAndCompanyIdAndIsDeleted(categoryName, companyId, 0);
//	}

	@Override
	public int findTotalCategoryRecord(long companyId, String searchValue) {
		return categoryRepository.findTotalCategoryRecord(companyId, searchValue);
	}

	@Override
	public List<CategoryVo>  findcategoryData(long companyId, String searchValue, int length, int offset) {
		return categoryRepository.findcategoryData( companyId, searchValue,  length,  offset);
	}

	@Override
	public List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchId(String name, long companyId) {
		return categoryRepository.findByCategoryNameIgnoreCaseAndBranchId(name, companyId);
	}

	@Override
	public List<CategoryVo> findByCategoryNameIgnoreCaseAndBranchIdAndCategoryIdNot(String upcategoryname, long companyId, long categoryId) {
		return categoryRepository.findByCategoryNameIgnoreCaseAndBranchIdAndCategoryIdNot(upcategoryname, companyId,categoryId);
	}

	@Override
	public CategoryVo findByCategoryIdAndCompanyIdAndIsDeleted(long id, long companyId, int i) {
		return categoryRepository.findByCategoryIdAndCompanyIdAndIsDeleted(id, companyId,i);
	}

	@Override
	public List<CategoryVo> findByCompanyIdAndIsDeleted(long companyId, int i) {
		return categoryRepository.findByCompanyIdAndIsDeleted(companyId,i);
	}

}
