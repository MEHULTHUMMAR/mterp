package com.erp.mterp.service.drawinglogic;

import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.product.ProductVo;

import java.util.List;
import java.util.Map;

public interface DrawingLogicService {
//Contact

	DrawingLogicDocVo savedrawingLogicDoc(DrawingLogicDocVo drawingLogicDocVo);

	List<DrawingLogicDocVo> findDLData(long companyId, String serachValue, int length, int offset);

	DrawingLogicDocVo findBydrawingLogicDocId(long id, long companyId);

	List<ProductVo> findProductByCompanyId(long companyId);

	String findNextDLNo(long companyId, String prefix);

	Integer countOfDLDatatable(String serachValue, long companyId, int i);

	List<Map<String,String>>  getdetailsByProductId(long id, long companyId,long planingItemId);
}
