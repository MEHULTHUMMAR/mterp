package com.erp.mterp.service.quotation;

import com.erp.mterp.repository.planing.PlaningItemDLRepository;
import com.erp.mterp.repository.planing.PlaningRepository;
import com.erp.mterp.repository.quotation.QuotationRepository;
import com.erp.mterp.vo.planing.PlaningItemDLVo;
import com.erp.mterp.vo.planing.PlaningVo;
import com.erp.mterp.vo.quotation.QuotationVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuotationServiceImpl implements QuotationService {
    @Autowired
    PlaningRepository planingRepository;

    @Autowired
    QuotationRepository quotationRepository;

    @Autowired
    PlaningItemDLRepository planingItemDLRepository;

    @Override
    public QuotationVo saveQuotation(QuotationVo quotationVo) {
        // TODO Auto-generated method stub
        return quotationRepository.save(quotationVo);
    }

    @Override
    public String findNextQuotationNo(long companyId, String prefix) {
        int no = 0;
        try {
            no = Integer.parseInt(quotationRepository.findNextQuotationNo(companyId, prefix));
        } catch (Exception e) {
            e.printStackTrace();
        }
        no++;
        return no + "";
    }

    @Override
    public Integer countOfQuotationDatatable(String serachValue, long companyId, int i) {
        return quotationRepository.countOfQuotationDatatable(serachValue, companyId, i);
    }

    @Override
    public List<Map<String, String>> findQuotationData(long companyId, String serachValue, int length, int offset) {
        return quotationRepository.findQuotationData(companyId, serachValue, length, offset);
    }

    @Override
    public QuotationVo findByQuotationId(long id, long companyId) {
        return quotationRepository.findByQuotationIdAndCompanyId(id, companyId);
    }

    @Override
    public void savePlaningItemDL(PlaningItemDLVo planingItemDLVo) {
        planingItemDLRepository.save(planingItemDLVo);
    }

    @Override
    public void updateplaningItemCost(long id) {
        planingRepository.updateplaningItemCost(id);
    }

}
