package com.erp.mterp.service.product;

import com.erp.mterp.repository.product.ProductRepository;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductRepository productRepository;
	

	@Override
	public ProductVo saveProduct(ProductVo productVo) {
		// TODO Auto-generated method stub
		return productRepository.save(productVo);
	}

	@Override
	public Integer countOfProductDatatable(String serachValue, long companyId, int i) {
		return productRepository.countOfProductDatatable( serachValue, companyId, i);
	}

	@Override
	public List<Map<String,String>> findproductData(long companyId, String serachValue, int length, int offset) {
		return productRepository.findproductData(companyId, serachValue, length, offset);
	}

	@Override
	public List<Map<String,String>> findByProductId(long id, long companyId) {
		return productRepository.findByProductId(id, companyId) ;
	}

	@Override
	public List<ProductVo> findProductByCompanyId(long companyId) {
		return productRepository.findProductByCompanyId(companyId);
	}

	@Override
	public List<Map<String,String>> findMaterialTypeList() {
		return productRepository.findMaterialTypeList();
	}

	@Override
	public List<Map<String,String>> findUOMList() {
		return productRepository.findUOMList();
	}

	@Override
	public List<Map<String, String>> findSubProductByCompanyIdAndIsDeleted(long companyId, int i) {
		return productRepository.findSubProductByCompanyIdAndIsDeleted( companyId, i);
	}

	@Override
	@Transactional
	public void deleteProduct(long id) {
		productRepository.deleteProduct(id);
	}

	@Override
	@Transactional
	public void deleteSubProductByMainProduct(long productId) {
		productRepository.deleteSubProductByMainProduct(productId);
	}


}
