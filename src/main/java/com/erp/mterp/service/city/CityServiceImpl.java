package com.erp.mterp.service.city;

import com.erp.mterp.repository.city.CityRepository;
import com.erp.mterp.vo.city.CityVo;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Service
@Log
public class CityServiceImpl implements CityService {
    @Autowired
    CityRepository cityRepository;

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public Iterable<CityVo> findAll() {//System.out.println(pointtableRepository.findByleadsource("LS").toString());
        return cityRepository.findAll();

    }

    @Override
    public List<CityVo> findByAll(String id) {
        return cityRepository.findByStateCode(id);

    }

    @Override
    public CityVo findByCityCode(String cityCode) {
        // TODO Auto-generated method stub
        return cityRepository.findByCityCode(cityCode);
    }
}

