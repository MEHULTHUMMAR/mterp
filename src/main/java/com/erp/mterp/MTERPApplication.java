package com.erp.mterp;

import java.text.ParseException;
import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.datatables.repository.DataTablesRepositoryFactoryBean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
//@EnableSwagger2
@EnableJpaRepositories(repositoryFactoryBeanClass = DataTablesRepositoryFactoryBean.class)
@EnableAsync
@EnableScheduling
public class MTERPApplication extends SpringBootServletInitializer {

    public static final String ACCOUNT_SID = "AC8d8784a59770a637ca48c4a5e4632895";
    public static final String AUTH_TOKEN = "fcd157a1a144e021df78b64e9b5a87e1";


    public static void main(String[] args) {
        SpringApplication.run(MTERPApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(MTERPApplication.class);
    }

    @PostConstruct
    public void init() throws ParseException {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata")); // It will set UTC timezone
    }

}
