package com.erp.mterp.service.planing;

import com.erp.mterp.vo.planing.PlaningItemDLVo;
import com.erp.mterp.vo.planing.PlaningVo;

import java.util.List;
import java.util.Map;

public interface PlaningService {
//Contact

    PlaningVo savePlaning(PlaningVo planingVo);

    String findNextPlaningNo(long companyId, String prefix);

    Integer countOfPlaningDatatable(String serachValue, long companyId, int i);

    List<Map<String, String>> findPlaningData(long companyId, String serachValue, int length, int offset);

    PlaningVo findByPlaningId(long id, long companyId);

    void savePlaningItemDL(PlaningItemDLVo planingItemDLVo);

    void updateplaningItemCost(long id);
}
