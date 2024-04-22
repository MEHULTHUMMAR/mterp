package com.erp.mterp.vo.userfront;

import javax.persistence.*;

@Entity
@Table(name = "user_front_log")
public class UserFrontLogVo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_front_log_id", length = 10)
    private long userFrontLogId;

    @ManyToOne
    @JoinColumn(name = "user_front_id", referencedColumnName = "user_front_id")
    private UserFrontVo userFrontVo;


    @Column(name = "ip_address", length = 50)
    private String ipAddress;

    @Column(name = "browser_info", length = 100)
    private String browserInfo;

    @Column(name = "os_info", length = 100)
    private String osInfo;

    @Column(name = "last_login", length = 50)
    private String lastLogin;

    public long getUserFrontLogId() {
        return userFrontLogId;
    }

    public void setUserFrontLogId(long userFrontLogId) {
        this.userFrontLogId = userFrontLogId;
    }

    public UserFrontVo getUserFrontVo() {
        return userFrontVo;
    }

    public void setUserFrontVo(UserFrontVo userFrontVo) {
        this.userFrontVo = userFrontVo;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getBrowserInfo() {
        return browserInfo;
    }

    public void setBrowserInfo(String browserInfo) {
        this.browserInfo = browserInfo;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getOsInfo() {
        return osInfo;
    }

    public void setOsInfo(String osInfo) {
        this.osInfo = osInfo;
    }


}
