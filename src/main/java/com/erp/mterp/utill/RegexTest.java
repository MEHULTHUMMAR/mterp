package com.erp.mterp.utill;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class RegexTest {
	public static boolean validateEmail(final String email) {
        String PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        Pattern pattern = Pattern.compile(PATTERN);
        Matcher matcher = pattern.matcher(email);

        if (matcher.matches()) {
            //System.out.println("Email " + email + " is valid");
            return true;
        } else {
            //System.out.println("Email " + email + " is invalid");
            return false;
        }
    }
	 public static boolean validateMobile(final String mobile) {
	        Pattern p = Pattern.compile("[0-9]+\\.?");
	        Matcher matcher = p.matcher(mobile);

	        if (matcher.matches()) {
	            //System.out.println("mobile " + mobile + " is valid");
	            return true;
	        } else {
	            //System.out.println("mobile" + mobile + " is invalid");
	            return false;
	        }
	    }
	 

		public static boolean validateFirstName(String name) {
			 //String PATTERN = "[^a-zA-Z0-9_-., ]";
			 String PATTERN = "[a-zA-Z0-9-.,_ ]+\\.?";
			 
		        Pattern pattern = Pattern.compile(PATTERN);
		        Matcher matcher = pattern.matcher(name);

		        if (matcher.matches()) { 
		            return true;
		        } else { 
		        	//log.info("invalid validateFirstName::"+name);
		            return false;
		        }
		}

}
