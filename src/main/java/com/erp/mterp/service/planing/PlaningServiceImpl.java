package com.erp.mterp.service.planing;

import com.erp.mterp.repository.planing.PlaningItemDLRepository;
import com.erp.mterp.repository.planing.PlaningRepository;
import com.erp.mterp.vo.planing.PlaningItemDLVo;
import com.erp.mterp.vo.planing.PlaningVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PlaningServiceImpl implements PlaningService {
    @Autowired
    PlaningRepository planingRepository;

    @Autowired
    PlaningItemDLRepository planingItemDLRepository;

    @Override
    public PlaningVo savePlaning(PlaningVo planingVo) {
        // TODO Auto-generated method stub
        return planingRepository.save(planingVo);
    }

    @Override
    public String findNextPlaningNo(long companyId, String prefix) {
        int no = 0;
        try {
            no = Integer.parseInt(planingRepository.findNextPlaningNo(companyId, prefix));
        } catch (Exception e) {
            e.printStackTrace();
        }
        no++;
        return no + "";
    }

    @Override
    public Integer countOfPlaningDatatable(String serachValue, long companyId, int i) {
        return planingRepository.countOfPlaningDatatable(serachValue, companyId, i);
    }

    @Override
    public List<Map<String, String>> findPlaningData(long companyId, String serachValue, int length, int offset) {
        return planingRepository.findPlaningData(companyId, serachValue, length, offset);
    }

    @Override
    public PlaningVo findByPlaningId(long id, long companyId) {
        return planingRepository.findByPlaningIdAndCompanyId(id, companyId);
    }

    @Override
    public void savePlaningItemDL(PlaningItemDLVo planingItemDLVo) {
        planingItemDLRepository.save(planingItemDLVo);
    }

    @Override
    public void updateplaningItemCost(long id) {
        planingRepository.updateplaningItemCost(id);
    }

    @Override
    public List<Map<String,String>> findPlaningForQuotation(long companyId) {
        return planingRepository.findPlaningForQuotation(companyId);
    }

}
