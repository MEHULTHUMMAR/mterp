package com.erp.mterp.service.bom;

import com.erp.mterp.repository.bom.BOMRepository;
import com.erp.mterp.repository.enquire.EnquireRepository;
import com.erp.mterp.vo.bom.BillOfMaterialVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class BOMServiceImpl implements BOMService {
	@Autowired
	EnquireRepository enquireRepository;

	@Autowired
	BOMRepository bomRepository;
	

	@Override
	public BillOfMaterialVo saveBOM(BillOfMaterialVo billOfMaterialVo) {
		// TODO Auto-generated method stub
		return bomRepository.save(billOfMaterialVo);
	}

	@Override
	public String findNextBOMNo(long companyId, String prefix) {
		int no=1;
		try {
			no = Integer.parseInt(bomRepository.findNextBOMNo(companyId, prefix));
		}catch (Exception e){
			e.printStackTrace();
		}
		no++;
		return no+"";
	}

	@Override
	public Integer countOfBOMDatatable(String serachValue, long companyId, int i) {
		return bomRepository.countOfBOMDatatable(serachValue, companyId,  i);
	}

	@Override
	public List<Map<String,String>> findBOMData(long companyId, String serachValue, int length, int offset) {
		return bomRepository.findBOMData(companyId, serachValue, length, offset);
	}

	@Override
	public BillOfMaterialVo findByBOMId(long id, long companyId) {
		return bomRepository.findByBillofmaterialIdAndCompanyId(id, companyId);
	}

	@Override
	public List<Map<String, String>> findEnquiryforPlaning(long companyId) {
		return enquireRepository.findEnquiryforPlaning(companyId);
	}

	@Override
	public void deleteBOMByPlaningId(long id) {
		bomRepository.deleteBOMByPlaningId( id);
	}

	@Override
	public void deleteBOM(long id) {
		bomRepository.deleteBOM( id);
	}

}
