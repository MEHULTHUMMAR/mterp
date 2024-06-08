package com.erp.mterp.service.bom;

import com.erp.mterp.vo.bom.BillOfMaterialVo;

import java.util.List;
import java.util.Map;

public interface BOMService {
//Contact

    BillOfMaterialVo saveBOM(BillOfMaterialVo billOfMaterialVo);

    String findNextBOMNo(long companyId, String prefix);

    Integer countOfBOMDatatable(String serachValue, long companyId, int i);

    List<Map<String,String>> findBOMData(long companyId, String serachValue, int length, int offset);

    BillOfMaterialVo findByBOMId(long id, long companyId);

    List<Map<String,String>> findEnquiryforPlaning(long companyId);

    void deleteBOMByPlaningId(long id);

    void deleteBOM(long id);
}
