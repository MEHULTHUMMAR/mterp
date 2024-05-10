package com.erp.mterp.repository.product;

import com.erp.mterp.vo.category.CategoryVo;
import com.erp.mterp.vo.contact.ContactVo;
import com.erp.mterp.vo.product.MaterialTypeVo;
import com.erp.mterp.vo.product.ProductUOMVo;
import com.erp.mterp.vo.product.ProductVo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface ProductRepository extends JpaRepository<ProductVo, Long> {


    @Query(nativeQuery = true, value = "SELECT\n"
            + "	count(1)\n"
            + "FROM\n"
            + "	product \n"
            + "WHERE\n"
            + "		case when ?1='' then 1=1 else \n"
            + "		(LOWER(product.product_name) like lower(concat('%',?1,'%')) \n"
            + "			or LOWER(product.itemcode) like lower(concat('%',?1,'%')) \n"
            + "			or LOWER(product.display_name) like lower(concat('%',?1,'%')) )end\n"
            + "	AND company_id = ?2 \n"
            + "	AND is_deleted = ?3")
    Integer countOfProductDatatable(String serachValue, long companyId, int i);

    @Query(value = "select\n" +
            "    product_id,\n" +
            "     capacity1,\n" +
            "     capacity2,\n" +
            "     certificate_required,\n" +
            "      display_name,\n" +
            "      itemcode,\n" +
            "      product_name,\n" +
            "      unit,\n" +
            "      c.category_name\n" +
            "    from product\n" +
            "    left join public.category c on c.category_id = product.category_id\n" +
            "    where product.company_id=?1 and product.is_deleted=0 and "
            + "		case when ?2 ='' then 1=1 else \n"
            + "		(LOWER(product.product_name) like lower(concat('%',?2,'%')) \n"
            + "			or LOWER(product.itemcode) like lower(concat('%',?2,'%')) \n"
            + "			or LOWER(product.display_name) like lower(concat('%',?2,'%')) )end order by product_id desc\n"
            + " limit ?3 offset ?4",nativeQuery = true)
    List<Map<String,String>> findproductData(long companyId, String serachValue, int length, int offset);

    @Query(value = "select * from product where product_id=?1 and company_id=?2",nativeQuery = true)
    ProductVo findByProductId(long id, long companyId);

    @Query(value = "select * from product where is_deleted=0 and company_id=?1",nativeQuery = true)
    List<ProductVo> findProductByCompanyId(long companyId);

    @Query(value = "select material_type_id,material_type from material_type",nativeQuery = true)
    List<Map<String,String>> findMaterialTypeList();

    @Query(value = "select product_uom_id,uom_name from product_uom",nativeQuery = true)
    List<Map<String,String>> findUOMList();
}
