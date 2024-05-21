package com.erp.mterp.service.quotation;

import com.erp.mterp.vo.planing.PlaningItemDLVo;
import com.erp.mterp.vo.planing.PlaningVo;
import com.erp.mterp.vo.quotation.QuotationVo;

import java.util.List;
import java.util.Map;

public interface QuotationService {
//Contact

    QuotationVo saveQuotation(QuotationVo quotationVo);

    String findNextQuotationNo(long companyId, String prefix);

    Integer countOfQuotationDatatable(String serachValue, long companyId, int i);

    List<Map<String, String>> findQuotationData(long companyId, String serachValue, int length, int offset);

    QuotationVo findByQuotationId(long id, long companyId);

    void savePlaningItemDL(PlaningItemDLVo planingItemDLVo);

    void updateplaningItemCost(long id);
}
