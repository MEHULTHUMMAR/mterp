package com.erp.mterp.constant;

import java.util.Arrays;
import java.util.List;

public class Constant {
    public static final long VYAPAR_ERP = 0;
    public static final long URID_CORPORATE = 1;
    public static final long URID_COMPANY = 2;
    public static final long URID_BRANCH = 3;
    public static final long URID_USER = 4;
    
    public static final String Discount = "Discount";
    public static final String FreeProduct = "Free Product";
    
    public static final String ProductWise = "productWise";
    public static final String BillWise = "BillWise";
    public static final String POINTSVALUE = "Points Value";
    
    public static final String IN = "IN";
    public static final String OUT = "OUT";
    
    public static final String STATUS404 = "404";
    public static final String STATUS100 = "100";
    public static final String STATUS200 = "200";
    public static final String STATUS201 = "201";
    public static final String STATUS400 = "400";
    public static final String STATUS401 = "401";
    public static final String STATUS500 = "500";
    public static final String STATUS412 = "412";


    public static final String CORPORATES = "corporates";
    public static final String CONTACT_COMPANY = "company";
    public static final String CONTACT_BRANCH = "branch";
    public static final String DEFAULT_LANGUAGE_CODE = "en";
    
    public static final long INSERT = 1;
    public static final long VIEW = 2;
    public static final long EDIT = 3;
    public static final long DELETE = 4;
    public static final long PDF_EXCEL_PRINT = 5;

    public static final String KEY = "JaewHxKm46v82veyb3JaG9rxZnC6BZDqLXxzywNNj7BRqaPPK2rM5WZbF2tksM7bUYrhgYXzPcGRSY79qBEGjrGnG4dckxcpw2RWecJzFEFPNUsD9w45K9ETCWtqqLgE";
    public static final String CREATE = "create";
    public static final String ISDELETE = "delete";
    public static final String EXCEL = "excel";
    public static final String PDF = "pdf";
    public static final String MAIL = "mail";
    public static final String REALPATH = "https://s3-us-west-2.amazonaws.com/";

    public static final String WHATSAPP_API_BASE = "http://whatsapp.croodstech.com/api/v1/whatsapp";
    public static final String WHATSAPP_API_AUTH = "/auth";
    public static final String WHATSAPP_API_LOGIN = "/login";
    public static final String WHATSAPP_API_SENDTEXT = "/send/text";
    public static final String WHATSAPP_PASSWORD = "83e4060e-78e1-4fe5-9977-aeeccd46a2b8";
    public static final String WHATSAPP_API_SENDDOC = "/send/document";
    
    public static final String COUPON = "coupon";
    public static final String POINTSETUP = "pointsetup";
	public static final String PRELOADINGPOINT = "preloadingpoint";

//	loyalty points type constant
	public static final String POINTDESCRIPTION="Adjust Points";
	public static final String SETUP_OPENING_POINT_DESCRIPTION="Opening Points";
	
//	securtiy config file constant
	public static final List<String> CSV_INJECTION_CHARACTERS = Arrays.asList("9", "10", "11", "13", "43", "45", "60",
			"61", "62", "64");
	public static final String FILE_IMAGE = "image";
	public static final String FILE_EXCEL = "excel";
	public static final String FILE_IMAGE_AND_PDF = "imagepdf";
	public static final String FILE_IMAGE_PDF_EXCEL_CSV = "imagepdfexcelcsv";

	public static final long MAX_FILE_SIZE_IMAGE = 10485760; // 10 MB
	public static final long MAX_FILE_SIZE_PDF_DOC_EXCEL = 10485760; // 10 MB
	public static final long MAX_FILE_SIZE_OTHER = 10485760; // 10 MB

	public static final List<String> VALID_FILE_TYPE_IMAGE = Arrays.asList("image/jpeg", "image/png", "image/bmp");
	public static final List<String> VALID_FILE_TYPE_IMAGE_PDF = Arrays.asList("image/jpeg", "image/png",
			"application/pdf");
	public static final List<String> VALID_FILE_TYPE_EXCEL = Arrays
			.asList("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	public static final List<String> VALID_FILE_TYPE_IMAGE_PDF_EXCEL_CSV = Arrays.asList("image/jpeg", "image/png",
			"application/pdf", "text/csv", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
			"application/vnd.ms-excel");
//	End Securityconfig file
	
//	customeruploadexcelsheet
	public static final int SHEETNAME = 0;
	public static final int SHEETMOBILENO = 1;
	public static final int SHEETEMAIL = 2;
	public static final int SHEETPOINTS=3;
	public static final String CONTACT_CUSTOMER = "customers";
	public static final int CONTACTSHEETREASON = 4;


}