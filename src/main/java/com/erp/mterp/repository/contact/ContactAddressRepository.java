package com.erp.mterp.repository.contact;

import com.erp.mterp.vo.contact.ContactAddressVo;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;

public interface ContactAddressRepository extends CrudRepository<ContactAddressVo, Long> {

    ContactAddressVo findByContactAddressId(Long contactAddressId);

    int countByContactContactIdAndIsDefault(long contactId, int i);
    
    List<ContactAddressVo> findAddressByContactContactId(Long userFrontId);
    
    @Transactional
    @Modifying
    @Query(value = "update contact_address set is_deleted=1 where contact_address_id=?1",nativeQuery = true)
    int deleteAddressById(long id); 
    
    @Transactional
    @Modifying
    @Query(value = "update contact_address set is_default = 0 where is_deleted = 0 and contact_id = :contactId",nativeQuery = true)
    int updateAllDefaultAddress( @Param("contactId") long contactId); 
    
    
//
//    @Query(value = "select \n"
//    		+ "	contact_address.contact_address_id as id,\n"
//    		+ "	loc_countries.countries_name as countriesName,\n"
//    		+ "	loc_state.state_name as stateName,\n"
//    		+ "	loc_city.city_name as cityName,\n"
//    		+ "	contact_address_id as contactAddressId,\n"
//    		+ "	contact_id as contactId,\n"
//    		+ "	name_title as nameTitle,\n"
//    		+ "	compny_name as companyName,\n"
//    		+ "	--landmark as landMark,         \n"
//    		+ "	address_type as addressType,\n"
//    		+ "	name as name,\n"
//    		+ "	first_name as firstName,\n"
//    		+ "	last_name as lastName,\n"
//    		+ "	address_line_1 as addressLine1,\n"
//    		+ "	address_line_2 as addressLine2,\n"
//    		+ "	address_line_3 as addressLine3,\n"
//    		+ "	contact_address.countries_code as countriesCode,\n"
//    		+ "	contact_address.zone_code as zoneCode,\n"
//    		+ "	contact_address.state_code as stateCode,\n"
//    		+ "	contact_address.city_code as cityCode,\n"
//    		+ "	contact_address.locality_code as localityCode,\n"
//    		+ "	contact_address.address_type as type,\n"
//    		+ "	contact_address.landmark as landmark,\n"
//    		+ "	contact_address.alternate_phone_no as alternateMobileNumber,\n"
//    		+ "	place as place,\n"
//    		+ "	coalesce(lat,0) as lat,\n"
//    		+ "	coalesce(lng,0) as lng,\n"
//    		+ "	pin_code as pinCode,\n"
//    		+ "	phone_no as phoneNo,\n"
//    		+ "	is_deleted as isDeleted,\n"
//    		+ "	is_default as isDefault\n"
//    		+ "	from contact_address\n"
//    		+ "	left join loc_countries on loc_countries.countries_code = contact_address.countries_code\n"
//    		+ "	left join loc_state on loc_state.state_code = contact_address.state_code\n"
//    		+ "	left join loc_city on loc_city.city_code = contact_address.city_code\n"
//    		+ "	where contact_address.contact_id=?1 and contact_address.is_deleted=0 order by contact_address_id desc",nativeQuery = true)
//    List<ContactAddressDTO> findContactAddressByContactId(long contactId);
//
//    @Query(value = "select \n"
//    		+"contact_address.contact_address_id as id,"
//            + "loc_countries.countries_name as countriesName,\n"
//            + "loc_state.state_name as stateName,\n"
//            + "loc_city.city_name as cityName,\n"
//            + "contact_address_id as contactAddressId,\n"
//            + "contact_id as contactId,\n"
//            + "name_title as nameTitle,\n"
//            + "compny_name as companyName,\n"
//            + "place as place,\n"
//            + "address_type as addressType,\n"
//            + "name as name,\n"
//            + "first_name as firstName,\n"
//            + "last_name as lastName,\n"
//            + "address_line_1 as addressLine1,\n"
//            + "address_line_2 as addressLine2,\n"
//            + "address_line_3 as addressLine3,\n"
//            + "contact_address.countries_code as countriesCode,\n"
//            + "contact_address.zone_code as zoneCode,\n"
//            + "contact_address.state_code as stateCode,\n"
//            + "contact_address.city_code as cityCode,\n"
//            + "contact_address.locality_code as localityCode,\n"
//            + "contact_address.address_type as type,\n"
//            + "contact_address.landmark as landmark,\n"
//            + "place as place,\n"
//            + "coalesce(lat,0) as lat,\n"
//            + "coalesce(lng,0) as lng,\n"
//            + "pin_code as pinCode,\n"
//            + "phone_no as phoneNo,\n"
//            + "is_deleted as isDeleted,\n"
//            + "is_default as isDefault\n"
//            + "from contact_address\n"
//            + "left join loc_countries on loc_countries.countries_code = contact_address.countries_code\n"
//            + "left join loc_state on loc_state.state_code = contact_address.state_code\n"
//            + "left join loc_city on loc_city.city_code = contact_address.city_code\n"
//            + "where contact_address.contact_id=?1 and contact_address.is_deleted=0 order by is_default desc",nativeQuery = true)
//    List<ContactAddressDTO> findContactAddresByContactId(long contactId);

	ContactAddressVo findByContactContactIdAndIsDefaultAndIsDeleted(long contactId, int i, int j);

}
