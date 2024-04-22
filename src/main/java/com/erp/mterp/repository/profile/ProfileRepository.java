package com.erp.mterp.repository.profile;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.erp.mterp.vo.userfront.UserFrontVo;

@Repository
public interface ProfileRepository extends JpaRepository<UserFrontVo, Long> {


    Iterable<UserFrontVo> findByUserFrontId(Long id);

    @Modifying
    @Query("update UserFrontVo set logo=?2 where userFrontId=?1")
    void updateLogo(Long id, String logo);

    @Modifying
    @Query("update UserFrontVo set watermark=?2 where userFrontId=?1")
    void updatewatermark(Long id, String watermark);

    @Transactional
    @Modifying
    @Query("update UserFrontVo set validityDays=0,status='inactive'")
    void updatedata();

    @Query(value = "select * from user_front where user_front_id in(select user_front_id from user_role_new where user_role_id=2)", nativeQuery = true)
    List<UserFrontVo> findbyAllCompanys();

    @Modifying
    @Query("update UserFrontVo set banner=?2 where userFrontId=?1")
    void updatebanner(long id, String name);
    
    @Modifying
    @Query("update UserFrontVo set thermalLogo=?2 where userFrontId=?1")
	void updateThermalLogo(long id, String fileName);


}
