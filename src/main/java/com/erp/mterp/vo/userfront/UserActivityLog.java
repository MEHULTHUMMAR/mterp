package com.erp.mterp.vo.userfront;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "user_activity_log")
@Data
public class UserActivityLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_activity_log_id", length = 10)
    private long userActivityLogId;

    @ManyToOne
    @JoinColumn(name = "user_front_id", referencedColumnName = "user_front_id")
    private UserFrontVo userFrontVo;

    @Column(name = "ip_address")
    private String ipAddress;

    @Column(name = "browser_info")
    private String browserInfo;

    @Column(name = "os_info")
    private String osInfo;

    @Column(name = "module")
    private String module;

    @Column(name = "description")
    private String description;

    @Column(name = "company_id")
    private long companyId;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    @Column(name = "log_date", updatable = false)
    private Date logDate;


    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "created_on", length = 50, updatable = false)
    private Date createdOn;


    @Column(name = "is_deleted", length = 1, columnDefinition = "int default 0")
    private int isDeleted;

    @Transient
    private String userAgent;

}
