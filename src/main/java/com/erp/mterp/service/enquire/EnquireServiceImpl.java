package com.erp.mterp.service.enquire;

import com.erp.mterp.repository.enquire.EnquireRepository;
import com.erp.mterp.repository.product.ProductRepository;
import com.erp.mterp.vo.enquire.EnquireVo;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EnquireServiceImpl implements EnquireService {
	@Autowired
	EnquireRepository enquireRepository;
	

	@Override
	public EnquireVo saveEnquire(EnquireVo enquireVo) {
		// TODO Auto-generated method stub
		return enquireRepository.save(enquireVo);
	}

	@Override
	public String findNextEnquiryNo(long companyId, String prefix) {
		int no=1;
		try {
			no = Integer.parseInt(enquireRepository.findNextEnquiryNo(companyId, prefix));
		}catch (Exception e){
			e.printStackTrace();
		}
		no++;
		return no+"";
	}

	@Override
	public Integer countOfEnquireDatatable(String serachValue, long companyId, int i) {
		return enquireRepository.countOfEnquireDatatable(serachValue, companyId,  i);
	}

	@Override
	public List<Map<String,String>> findEnquiryData(long companyId, String serachValue, int length, int offset) {
		return enquireRepository.findEnquiryData(companyId, serachValue, length, offset);
	}

	@Override
	public EnquireVo findByEnquireId(long id, long companyId) {
		return enquireRepository.findByEnquireIdAndCompanyId(id, companyId);
	}

	@Override
	public List<Map<String, String>> findEnquiryforPlaning(long companyId) {
		return enquireRepository.findEnquiryforPlaning(companyId);
	}

}
