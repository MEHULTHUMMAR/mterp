package com.erp.mterp.vo.error;

import javax.persistence.*;

import lombok.Data;

@Data
@Entity
@Table(name = "error_log")
public class ErrorLogVo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "error_id", length = 10)
    private long errorId;

    @Column(name = "status_code", columnDefinition = "int default 0")
    private Integer statusCode;

    @Column(name = "error_description", columnDefinition = "TEXT")
    private String errorDescription;

    @Column(name = "error_root_cause", columnDefinition = "TEXT")
    private String errorRootCause;

    @Column(name = "error_stack_trace", columnDefinition = "TEXT")
    private String errorStackTrace;

    @Column(name = "error_date", length = 40)
    private String errorDate;

    @Column(name = "branch_id", length = 10)
    private String branchId;

    @Column(name = "error_path", columnDefinition = "TEXT")
    private String errorPath;


}

