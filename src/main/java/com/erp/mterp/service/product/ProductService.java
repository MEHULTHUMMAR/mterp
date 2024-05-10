package com.erp.mterp.service.product;

import com.erp.mterp.dto.contact.ContactCustomDatatableDTO;
import com.erp.mterp.dto.contact.ContactManageDTO;
import com.erp.mterp.dto.pointledger.PointLedgerDTO;
import com.erp.mterp.vo.contact.ContactManageVo;
import com.erp.mterp.vo.contact.ContactTransactionVo;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.product.MaterialTypeVo;
import com.erp.mterp.vo.product.ProductUOMVo;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ProductService {
//Contact

	ProductVo saveProduct(ProductVo productVo);

	Integer countOfProductDatatable(String serachValue, long companyId, int i);


	List<Map<String,String>> findproductData(long companyId, String serachValue, int length, int offset);

	ProductVo findByProductId(long id, long companyId);

	List<ProductVo> findProductByCompanyId(long companyId);

	List<Map<String,String>> findMaterialTypeList();

	List<Map<String,String>> findUOMList();
}
