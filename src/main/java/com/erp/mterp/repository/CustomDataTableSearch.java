package com.erp.mterp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.datatables.SpecificationBuilder;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import javax.persistence.EntityManager;
import java.io.Serializable;
import java.util.List;

public class CustomDataTableSearch<T, ID extends Serializable> extends SimpleJpaRepository<T, ID> {

    public CustomDataTableSearch(JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        // TODO Auto-generated constructor stub
    }

    public <R> DataTablesOutput<R> findAll(DataTablesInput input,
                                           Specification<T> additionalSpecification, Specification<T> preFilteringSpecification) {
        DataTablesOutput<R> output = new DataTablesOutput<>();
        output.setDraw(input.getDraw());
        if (input.getLength() == 0) {
            return output;
        }

        try {
            long recordsTotal =
                    preFilteringSpecification == null ? count() : count(preFilteringSpecification);
            if (recordsTotal == 0) {
                return output;
            }
            output.setRecordsTotal(recordsTotal);

            SpecificationBuilder<T> specificationBuilder = new SpecificationBuilder<>(input);
            Page<T> data = findAll(
                    Specification.where(specificationBuilder.build())
                            .or(additionalSpecification)
                            .and(preFilteringSpecification),
                    specificationBuilder.createPageable());

            @SuppressWarnings("unchecked")
            List<T> content = (List<T>) data.getContent();
            output.setData((List<R>) content);
            output.setRecordsFiltered(data.getTotalElements());

        } catch (Exception e) {
            output.setError(e.toString());
        }

        return output;
    }
}
