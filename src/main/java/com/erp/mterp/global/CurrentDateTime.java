package com.erp.mterp.global;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class CurrentDateTime {

    static Date todayDate;
    static DateFormat dateFormat;


    public static String getCurrentDate() {
        todayDate = new Date();
        dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
        return dateFormat.format(todayDate);
    }

    public static String getCurrentYear() {
        todayDate = new Date();
        dateFormat = new SimpleDateFormat("yyyy");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
        return dateFormat.format(todayDate);
    }

    public static String getTodayDate() {
        todayDate = new Date();
        dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
        return dateFormat.format(todayDate);
    }

    public static String getYesterDayDate() {
        todayDate = new Date();
        dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));

        return dateFormat.format(todayDate);
    }
    
    public static String getFinancialYearInterval() {
    	try {
    		System.err.println("-------------getFinancialYearInterval()------------------");
        	int CurrentYear = Calendar.getInstance().get(Calendar.YEAR);
        	int CurrentMonth = (Calendar.getInstance().get(Calendar.MONTH)+1);
        	String financiyalYearFrom="";
        	String financiyalYearTo="";
        	if (CurrentMonth<4) {
        	    financiyalYearFrom=""+(CurrentYear-1);
        	    financiyalYearTo=""+(CurrentYear);
        	} else {
        	    financiyalYearFrom=""+(CurrentYear);
        	    financiyalYearTo=""+(CurrentYear+1);
        	}
        	System.err.println("financiyalYearFrom is :"+financiyalYearFrom);
        	System.err.println("financiyalYearTo is :"+financiyalYearTo);
        	System.err.println("financiyalYear is :"+financiyalYearFrom+"-"+financiyalYearTo);
        	System.err.println("-------------getFinancialYearInterval()------------------");
            return financiyalYearFrom+"-"+financiyalYearTo;
    	}catch (Exception e) {
    		System.err.println("--ERROR-----------getFinancialYearInterval()-------------ERROR-----");
			e.printStackTrace();
			return "2019-2020";
		}
    	
    }

    public static String getFirstDate(String monthInterval, String defaultYearInterval) {
        // TODO Auto-generated method stub
        System.out.println(defaultYearInterval + "---------" + monthInterval);
        String[] yearList = defaultYearInterval.split("-");
        String[] monthList = monthInterval.split("-");

        YearMonth yearMonth = YearMonth.of(Integer.parseInt(yearList[0]), Integer.parseInt(monthList[0]));
        LocalDate firstOfMonth = yearMonth.atDay(1);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        return firstOfMonth.format(formatter);
    }

    public static String getLastDate(String monthInterval, String defaultYearInterval) {
        // TODO Auto-generated method stub
        String[] yearList = defaultYearInterval.split("-");
        String[] monthList = monthInterval.split("-");

        YearMonth yearMonth = YearMonth.of(Integer.parseInt(yearList[1]), Integer.parseInt(monthList[1]));
        LocalDate last = yearMonth.atEndOfMonth();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        return last.format(formatter);
    }


    public static java.sql.Date getSqlDate(String string) {
        // TODO Auto-generated method stub

        SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");

        try {
            return new java.sql.Date((sdf1.parse(string)).getTime());
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }


}
