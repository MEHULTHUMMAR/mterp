package com.erp.mterp.repository.user;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.userfront.UserFrontVo;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<UserFrontVo, Long>, DataTablesRepository<UserFrontVo, Long> {
    // @Query("from GlobalUserVo where global_user_id =:uid")

    UserFrontVo findByUserFrontId(long id);

    @Query("from UserFrontVo where  userName=?1 And is_deleted=0")
    UserFrontVo findByUserName(String username);

    @Modifying
    @Query("update UserFrontVo set defaultYearInterval=?2 where userFrontId=?1")
    void updateDefaultYear(long id, String defaultYearInterval);

    @Query(value = "SELECT * from user_front INNER JOIN user_role_new on user_role_new.user_front_id=user_front.user_front_id  WHERE parent_id=?1 and user_role_new.user_role_id in (2,3) and company_id=?1", nativeQuery = true)
    List<UserFrontVo> getListOfBranch(long companyId);

    @Query(value = "SELECT * from user_front INNER JOIN user_role_new on user_role_new.user_front_id=user_front.user_front_id  WHERE parent_id=?1  and company_id=?1", nativeQuery = true)
    List<UserFrontVo> getListOfBranchWithEmployee(long companyId);

    // @Query("SELECT u FROM UserFrontVo u JOIN FETCH u.roles WHERE u.userName=?1")
    // @Query("SELECT u FROM UserFrontVo u JOIN FETCH u.roles WHERE u.roles=4")
    // List<UserFrontVo> findByUserFrontVoUserFrontIdAndRolesIn(long parentId,
    // List<UserRoleVo> roleIds);

    @Query(nativeQuery = true, value = "select *from user_front uf, user_role_new ur where uf.parent_id = ?1 and ur.user_front_id=uf.user_front_id and ur.user_role_id=?2")
    List<UserFrontVo> findByUserFrontVoAndrolesIn(long id, long s);

    @Query("from UserFrontVo where  userName=?1 And is_deleted=0")
    List<UserFrontVo> findByUserName1(String name);

    @Query("from UserFrontVo where  userName=?1 And is_deleted=0 and userFrontId!=?2 ")
    List<UserFrontVo> findByUserNameAndUserFrontIdNot(String usernameup, long userFrontId);

    List<UserFrontVo> findByUserNameIgnoreCase(String string);

    @Modifying
    @Query("update UserFrontVo set usedSms=usedSms+?2 where userFrontId=?1")
    void updateUsedSMS(long id, long usedSMS);

    @Query("from UserFrontVo where company_id=?1 And is_deleted=0 ")
    List<UserFrontVo> getAllUserOfCompany(long companyId);

    @Query("from UserFrontVo where userFrontId=?1")
    UserFrontVo findByCompanyId(long companyid);

    @Modifying
    @Query("update UserFrontVo set dailySmsReport=?2,dailySmsReportSentTime=?3,dailyMailReport=?4,dailyMailReportSentTime=?5 where userFrontId=?1")
    UserFrontVo updateDailyReport(long companyid, int dailysms, int dailysmstime, int dailymail,
                                  int dailymailtime);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id=2) and daily_report_mail=1 and sent_daily_mail_time=?1", nativeQuery = true)
    List<UserFrontVo> findUserForDilyMail(int time);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id=2) and daily_report_sms=1 and sent_daily_sms_time=?1", nativeQuery = true)
    List<UserFrontVo> findUserForDailySms(int time);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id=2) and is_deleted=0", nativeQuery = true)
    List<UserFrontVo> findAllCompany();

    UserFrontVo findByUserNameAndStatusAndIsDeleted(String userName, String status,int isdeleted);

    @Query(value = "SELECT * FROM user_front WHERE user_front_id in(select user_front_id from user_role_new where user_role_id=2)   and cast((now()\\:\\:date -demo_start_date) as bigint) > validity_days", nativeQuery = true)
    List<UserFrontVo> getDemoTrialCompany();

    @Modifying
    @Query("update UserFrontVo set status=?1 where companyId=?2")
    void inActiveAllAccountByCompany(String status, long companyid);

    @Query(value = "select * from user_front where status=?3 AND is_deleted=?1 AND (string_to_array(domain_name,',')@>string_to_array(CONCAT('',?2,''), ',')) AND  user_front_id in(select user_front_id from user_role_new where user_role_id=2)", nativeQuery = true)
    List<UserFrontVo> findByIsDeletedAndDomainnameContainingIgnoreCaseAndStatus(int isdeleted, String domain,
                                                                                String status);

    // --Commented out by Inspection (08/11/20, 2:04 AM):UserFrontVo findByUserNameAndPassword(String username, String password);

    @Query(value = "SELECT assigned_sms-used_sms as available_sms FROM user_front WHERE user_front_id =?1", nativeQuery = true)
    int findAvailableMessage(long companyid);

    @Query(value = "select userFrontId from UserFrontVo where status=?2 AND isDeleted=?3 AND LOWER(name) like LOWER(concat('%', ?1,'%'))")
    List<Long> findByNameIgnoreCaseAndStatusAndIsDeleted(String name, String status, int i);

    // --Commented out by Inspection (08/11/20, 2:04 AM):List<UserFrontVo> findByUserFrontVoUserFrontId(long companyId);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id=3) and company_id=?1", nativeQuery = true)
    List<UserFrontVo> findAllBranchByCompany(long companyId);

    @Modifying
    @Query("update UserFrontVo set status=?1 where userFrontVo.userFrontId=?2")
    void changeStatusAllBranchByCompnayId(String string, Long id);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id>3) and company_id=?1", nativeQuery = true)
    List<UserFrontVo> getListOfEmployee(long companyId);

    @Modifying
    @Query("update UserFrontVo set whatsappToken = ?2, modifiedOn = ?3 where userFrontId = ?1")
    void updateWhatsappTokenByUserFrontId(long userFrontId, String whatsappToken, String modifiedOn);

    @Query(value = "select * from user_front where status='active' AND is_deleted=0 AND (string_to_array(domain_name,',')@>string_to_array(CONCAT('',?1,''), ',')) AND  user_front_id in(select user_front_id from user_role_new where user_role_id=2)", nativeQuery = true)
    UserFrontVo findByDomainInCompany(String serverName);

    @Query(value = "select count(*) from user_front where is_deleted=0 AND user_front_id in(select user_front_id from user_role_new where user_role_id=2)", nativeQuery = true)
    long getTotalClientsRoleIdIsDeleted();

    @Query(value = "select count(*) from user_front where status=?1 AND is_deleted=0 AND user_front_id in(select user_front_id from user_role_new where user_role_id=2)", nativeQuery = true)
    long getClientsRoleIdStatusIsDeleted(String data);

    @Query(value = "select * from user_front where is_deleted=0 and demo_start_date IS NOT NULL AND user_front_id in(select user_front_id from user_role_new where user_role_id=2 )order by demo_start_date desc  limit 5", nativeQuery = true)
    List<UserFrontVo> findByCompanyAndIsDeleted();

    @Query(value = "select * from user_front where is_deleted=0 And  next_renewal_date between ?1 And ?2 AND user_front_id in(select user_front_id from user_role_new where user_role_id=2)limit 5", nativeQuery = true)
    List<UserFrontVo> getRenewalCustomers(Date currentDate, Date betweenDate);

    @Query(value = "select Count(user_front.industry_id),user_front.industry_id,tbl_industry.industry_name from user_front\n" +
            "inner join tbl_industry on tbl_industry.industry_id = user_front.industry_id\n" +
            "where is_deleted=0 AND user_front_id in(select user_front_id from user_role_new where user_role_id=2)\n" +
            "GROUP BY user_front.industry_id,tbl_industry.industry_name ORDER by count desc", nativeQuery = true)
    List<Object[]> getTopPerformingCustomer();

    @Query(value = "select Count(user_front.industry_id),user_front.industry_id,tbl_industry.industry_name from user_front\n" +
            "inner join tbl_industry on tbl_industry.industry_id = user_front.industry_id\n" +
            "where is_deleted=0 AND user_front_id in(select user_front_id from user_role_new where user_role_id=2)\n" +
            "GROUP BY user_front.industry_id,tbl_industry.industry_name ORDER by count", nativeQuery = true)
    List<Object[]> getBottomPerformingCustomer();

    @Query(value = "select user_front_id,name,status from user_front where is_deleted=0 AND parent_id=?1 and user_front_id in(select user_front_id from user_role_new where user_role_id=?2)", nativeQuery = true)
    List<Object[]> getBranches(long id, int role);

    @Query(value = "select cast(sum(total) as varchar) from(\n"
            + "select count(user_front.user_front_id) as total,EXTRACT(MONTH FROM demo_start_date)\\:\\:integer as demo_start_date FROM user_front\n"
            + "left join user_role_new on user_role_new.user_front_id = user_front.user_front_id\n"
            + " where user_role_new.user_role_id=?2 and \n"
            + "	cast(EXTRACT(YEAR FROM demo_start_date)as varchar) = ?1\n"
            + "group by EXTRACT(MONTH FROM demo_start_date) \n"
            + "union all \n"
            + "select 0 as total,generate_series(1,12) as demo_start_date\n"
            + "	)as m group by demo_start_date order by demo_start_date", nativeQuery = true)
    List<String> getTotalSignupMonthwise(String year, int role);

    @Query(value = "select Count(user_front.user_front_id),loc_city.city_name from user_front \n"
            + "left join loc_city on loc_city.city_code=user_front.city_code\n"
            + "where is_deleted=0 AND  user_front_id in(select user_front_id from user_role_new where user_role_id=2)\n"
            + "GROUP BY loc_city.city_name ORDER by count desc limit 5", nativeQuery = true)
    List<Object[]> getTopPerformingCitywiseCustomer();

    @Query(value = "select Count(user_front.user_front_id),loc_city.city_name from user_front \n"
            + "left join loc_city on loc_city.city_code=user_front.city_code\n"
            + "where is_deleted=0 AND  user_front_id in(select user_front_id from user_role_new where user_role_id=2)\n"
            + "GROUP BY loc_city.city_name ORDER by count asc limit 5", nativeQuery = true)
    List<Object[]> getBottomPerformingCitywiseCustomer();

    //	@Query(value="select * from user_front\n"
//			+ "left join sales on user_front.user_front_id=sales.createdby_id\n"
//			+ "where sales.is_deleted=0 and sales.branch_id=?1 and LOWER(name) like LOWER(concat('%', ?2,'%'))",nativeQuery = true)
    @Query(value = "select user_front.* from employee inner join user_front on employee.user_front_id=user_front.user_front_id\n"
            + "where employee.is_deleted=0  and branch_id=?1", nativeQuery = true)
    List<UserFrontVo> getListOfCreatedByName(long branchId);

    @Query(value = "select * from user_front where user_name=?1 and is_deleted=0 and (string_to_array(domain_name,',')@>string_to_array(CONCAT('',?2,''), ','))", nativeQuery = true)
	UserFrontVo findByUserNameAndDomain(String username, String domain);

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id>3) and parent_id=?1", nativeQuery = true)
	List<UserFrontVo> getListOfEmployeeBranchWise(long branchId);

	UserFrontVo findByUserFrontIdAndIsDeletedAndStatus(long branchId, int i, String status);

//	@Query(value = "\n" +
//            "select case when \n" +
//            "(select\n" +
//            "COALESCE(user_front_id,0)\n" +
//            "from user_Front\n" +
//            "where access_key =?1 and secret_key=?2)!=0 then \n" +
//            "(select\n" +
//            "COALESCE(user_front_id,0)\n" +
//            "from user_Front\n" +
//            "where access_key =?1 and secret_key=?2)else 0 end \n" +
//            "\n",nativeQuery = true)
//	long findByAccessKeyAndSecretKey(String accessKey, String secretKey);

    @Query(value = "select coalesce((select\n" +
            "            COALESCE(user_front_id,0)\n" +
            "            from user_Front\n" +
            "            where access_key =?1 and secret_key=?2),0) ",nativeQuery = true)
    long findByAccessKeyAndSecretKey(String accessKey, String secretKey);

	
	 @Query(value = "select count(access_key) from user_front where access_key=?1",nativeQuery =true) 
	 long findByAccessKey(String accessKey);
	 
	 @Query(value = "select count(secret_key) from user_front where secret_key=?1",nativeQuery =true) 
	 long findBySecretKey(String secretKey);
	 
	/*
	 * @Query("select count(accessKey) from UserFrontVo where accessKey=?1")
	 * UserFrontVo findByAccessKey(String accessKey);
	 * 
	 * @Query(value = "select count(secret_key) from user_front where secretKey=?1")
	 * UserFrontVo findBySecretKey(String secretKey);
	 */

	 @Modifying
	 @Transactional
	 @Query(value = "update user_front set access_key =?2,secret_key = ?3 where user_front_id = ?1",nativeQuery = true)
	 void updateAccessKeyAndSecretKeyByUserFrontId(long userFrontId, String accessKey, String secretKey);
}
