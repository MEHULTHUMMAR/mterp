package com.erp.mterp.service.city;

import com.erp.mterp.vo.city.CityVo;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

public interface CityService {

    Iterable<CityVo> findAll();

    List<CityVo> findByAll(String id);

    CityVo findByCityCode(String cityCode);


}