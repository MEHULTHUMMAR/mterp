package com.erp.mterp.vo.contact;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "contact_address")
@Getter
@Setter
public class ContactAddressVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @Transient
    String countriesName;
    @Transient
    String stateName;
    @Transient
    String cityName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "contact_address_id", length = 10)
    private long contactAddressId;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "contact_id", referencedColumnName = "contact_id")
    private ContactVo contact;
    
    @Column(name = "contact_name")
    private String contactName;

    @Column(name = "address", length = 300, columnDefinition = "text")
    private String address;

    @Column(name = "countries_code", length = 50)
    private String countriesCode;

    @Column(name = "state_code", length = 50)
    private String stateCode;
    
    @Column(name = "city_code", length = 50)
    private String cityCode;

    @Column(name = "pin_code", length = 50)
    private String pinCode;
    
    @Column(name = "mob_no", length = 17)
    private String mobNo;
    

    @Column(name = "is_deleted", length = 1, columnDefinition = "int default 0")
    private int isDeleted;

    @Column(name = "is_default", length = 1, columnDefinition = "int default 0")
    private int isDefault;

}
