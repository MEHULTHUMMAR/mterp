package com.erp.mterp.service.product;

import com.erp.mterp.vo.product.ProductVo;

import java.util.List;
import java.util.Map;

public interface ProductService {
//Contact

	ProductVo saveProduct(ProductVo productVo);

	Integer countOfProductDatatable(String serachValue, long companyId, int i);


	List<Map<String,String>> findproductData(long companyId, String serachValue, int length, int offset);

	List<Map<String,String>> findByProductId(long id, long companyId);

	List<ProductVo> findProductByCompanyId(long companyId);

	List<Map<String,String>> findMaterialTypeList();

	List<Map<String,String>> findUOMList();

	List<Map<String,String>> findSubProductByCompanyIdAndIsDeleted(long companyId, int i);

	void deleteProduct(long id);

	void deleteSubProductByMainProduct(long productId);
}
