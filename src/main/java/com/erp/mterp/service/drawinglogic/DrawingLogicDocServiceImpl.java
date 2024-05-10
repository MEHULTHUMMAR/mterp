package com.erp.mterp.service.drawinglogic;

import com.erp.mterp.repository.drawinglogic.DrawingLogicRepository;
import com.erp.mterp.repository.product.ProductRepository;
import com.erp.mterp.vo.drawinglogic.DrawingLogicDocVo;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DrawingLogicDocServiceImpl implements DrawingLogicService {
	@Autowired
	ProductRepository productRepository;

	@Autowired
	DrawingLogicRepository drawingLogicRepository;

	@Override
	public DrawingLogicDocVo savedrawingLogicDoc(DrawingLogicDocVo drawingLogicDocVo) {
		// TODO Auto-generated method stub
		return drawingLogicRepository.save(drawingLogicDocVo);
	}

	@Override
	public Integer countOfDLDatatable(String serachValue, long companyId, int i) {
		return drawingLogicRepository.countOfDLDatatable( serachValue, companyId, i);
	}

	@Override
	public List<Map<String,String>>  getdetailsByProductId(long id, long companyId,long planingItemId) {
		return drawingLogicRepository.getdetailsByProductId( id,  companyId,planingItemId) ;
	}

	@Override
	public List<DrawingLogicDocVo> findDLData(long companyId, String serachValue, int length, int offset) {
		return drawingLogicRepository.findDLData(companyId, serachValue, length, offset);
	}

	@Override
	public DrawingLogicDocVo findBydrawingLogicDocId(long id, long companyId) {
		return drawingLogicRepository.findBydrawingLogicDocId(id, companyId) ;
	}

	@Override
	public List<ProductVo> findProductByCompanyId(long companyId) {
		return productRepository.findProductByCompanyId(companyId);
	}

	@Override
	public String findNextDLNo(long companyId, String prefix) {
		int no=0;
		try {
			no = Integer.parseInt(drawingLogicRepository.findNextDLNo(companyId, prefix));
		}catch (Exception e){
			e.printStackTrace();
		}
		no++;
		return no+"";
	}


}
