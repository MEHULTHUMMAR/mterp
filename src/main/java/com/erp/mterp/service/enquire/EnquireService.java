package com.erp.mterp.service.enquire;

import com.erp.mterp.vo.enquire.EnquireVo;
import com.erp.mterp.vo.product.ProductVo;

import java.util.List;
import java.util.Map;

public interface EnquireService {
//Contact

	EnquireVo saveEnquire(EnquireVo enquireVo);

    String findNextEnquiryNo(long companyId, String prefix);

    Integer countOfEnquireDatatable(String serachValue, long companyId, int i);

    Object findEnquiryData(long companyId, String serachValue, int length, int offset);

    EnquireVo findByEnquireId(long id, long companyId);

    List<Map<String,String>> findEnquiryforPlaning(long companyId);
}
