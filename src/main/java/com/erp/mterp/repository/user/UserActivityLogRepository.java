package com.erp.mterp.repository.user;

import java.util.List;

import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.userfront.UserActivityLog;


@Repository
public interface UserActivityLogRepository extends DataTablesRepository<UserActivityLog, Long>, JpaRepository<UserActivityLog, Long> {

    List<UserActivityLog> findByUserFrontVoUserFrontId(long companyId);
    //List<UserActivityLog> GetAllLogs(int i);

    @Query(value = "select * from user_activity_log where company_id=?1 order by user_activity_log_id desc limit 1", nativeQuery = true)
    UserActivityLog findByLogActivityCompanyId(long id);

}
