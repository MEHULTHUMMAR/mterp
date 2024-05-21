package com.erp.mterp.utill;

import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

import lombok.extern.java.Log;

@Log
@Component
public class Msg91 {
    static final String authkey = "285406Aqd7jfrQL0N615c7cbcP1";
    private static String send = "true";
   
    public static boolean sendOtp(String mob, String msg,String TEMPLETE_ID,String senderId) {
        boolean status = false;
        String query = null;
        HttpResponse<String> response = null;
        try {                //285406Aqd7jfrQL0N615c7cbcP1

            

                query = String.format("https://api.msg91.com/api/sendhttp.php?mobiles=" + mob + "&authkey=285406Aqd7jfrQL0N615c7cbcP1&route=4&sender=" + senderId + "&message=%s" + "&country=91&DLT_TE_ID="+TEMPLETE_ID
                        , URLEncoder.encode(msg, charset));

                response = Unirest.post(query).asString();
                System.out.println(response + "::::::::::::::::::::::::::::::::::::::::::::::::");
           
        } catch (UnirestException e) {

            e.printStackTrace();
        } catch (Exception e) {
            // sTODO Auto-generated catch block
            e.printStackTrace();
        }


        return true;

    }

    static final String _url = "http://control.msg91.com/api/";
    //static final String _sender = "VSYERP";
    static final String otpmsg = "Your verification code is ##OTP## for E-Commerce.";
    static final String verifyotpurl = "verifyRequestOTP.php";
    static final String sendotpurl = "sendotp.php";
    static final String charset = "UTF-8";

   
    
	/*
	  
	  
	HttpResponse<String> response = Unirest.post(_url+"sendotp.php?template=&otp_length=&authkey=&message=&sender=&mobile=&otp=&otp_expiry=&email=")
.asString();  
	  
	  
	  
	  
	  
	  HttpResponse<String> response = Unirest.post("https://control.msg91.com/api/verifyRequestOTP.php?authkey=&mobile=&otp=")
.header("content-type", "application/x-www-form-urlencoded")
.asString();
*/

    public static boolean sendMsg(String mob, String msg, HttpSession session,String senderId) {
        boolean status = false;
        String query = null;
        HttpResponse<String> response = null;

        try {                //285406Aqd7jfrQL0N615c7cbcP1

            if (send.equals("true")) {

                if (Long.parseLong(session.getAttribute("companyId").toString()) == 79) {
                    System.out.println("HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
//                    query = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid=SARHAD&dest_mobileno=" + mob + "&message=%s&response=Y"
//                            , URLEncoder.encode(msg, charset));
//
//
//                    String query2 = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid=SARHAD&dest_mobileno=9712948736" + "&message=%s&response=Y"
//                            , URLEncoder.encode(msg, charset));
                    query = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid="+senderId+"&dest_mobileno=" + mob + "&message=%s&response=Y"
                            , URLEncoder.encode(msg, charset));


                    String query2 = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid="+senderId+"&dest_mobileno=9712948736" + "&message=%s&response=Y"
                            , URLEncoder.encode(msg, charset));

                    response = Unirest.post(query2).asString();
                    status = true;

                }else if (Long.parseLong(session.getAttribute("companyId").toString()) == 228) {
//                    String query2 = String.format("http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername=NEWMRT&smstype=TRANS&numbers="+mob+"&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4&response=Y"
//                            , URLEncoder.encode(msg, charset));
                    String query2 = String.format("http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername="+senderId+"&smstype=TRANS&numbers="+mob+"&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4&response=Y"
                            , URLEncoder.encode(msg, charset));

                    log.info("JNM "+query2);
                    response = Unirest.post(query2).asString();
                    status = true;

                } else {
                	 log.info("here msg911111 ");
                    query = String.format("https://api.msg91.com/api/sendhttp.php?mobiles=" + mob + "&authkey=285406Aqd7jfrQL0N615c7cbcP1&route=4&sender=" + senderId + "&message=%s" + "&country=91"
                            , URLEncoder.encode(msg, charset));
                    response = Unirest.post(query).asString();
                }

                System.out.println(response + "::::::::::::::::::::::::::::::::::::::::::::::::" + response.getStatus());
                status = response.getStatus() == 200;
            } else {
                System.out.println("SMS NOT SEND NOT PERMISSION");
                status = false;
            }
        } catch (UnirestException e) {

            e.printStackTrace();
        } catch (Exception e) {
            // sTODO Auto-generated catch block
            e.printStackTrace();
        }


        return status;

    }
//    public static boolean sendOtp(String mob)
//    {
//    	boolean status = false;    	
//    	String query=null;
//    	HttpResponse<String> response = null;
//
//    	try 
//    	{	 query = String.format(_url+sendotpurl+"?template=&otp_length=4&authkey="+authkey+"&message=%s"+"&sender="+_sender+"&mobile="+mob+"&otp=&otp_expiry=&email="
//    	        		,URLEncoder.encode(otpmsg,charset));
//    	     
//    		response = Unirest.post(query).asString();
//    		
//    		
//		} catch (UnirestException e) 
//    	{
//	
//			e.printStackTrace();
//		} catch (UnsupportedEncodingException e) {
//			// sTODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//    	
//    	JSONObject myObject = new JSONObject(response.getBody());    
//    	
//    	String value = myObject.getString("type");
//
//    	response.getStatus();
//    	
//    	if(value.equals("success")) 
//    	{
//    		status=true;
//    	}
//    	return status;
//    	
//    }

    public static boolean verifyOtp(String mob, String otp) {
        boolean status = false;

        HttpResponse<String> response = null;

        try {
            response = Unirest.post(_url + verifyotpurl + "?authkey=" + authkey + "&mobile=" + mob + "&otp=" + otp + "")
                    .header("content-type", "application/x-www-form-urlencoded")
                    .asString();
        } catch (UnirestException e) {

            e.printStackTrace();
        }

        JSONObject myObject = new JSONObject(response.getBody());

        String value = myObject.getString("type");

        response.getStatus();

        if (value.equals("success")) {
            status = true;
        }
        // testing to return true

        return status;


    }

    public static boolean sendMsg(String mob, String msg, long companyid,String TEMPLETE_ID,String senderId) {
        boolean status = false;
        String query = null;
        HttpResponse<String> response = null;

        try {                //285406Aqd7jfrQL0N615c7cbcP1

            if (send.equals("true")) {

                if (companyid == 79) {
                    System.out.println("HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
//                    query = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid=SARHAD&dest_mobileno=" + mob + "&message=%s&response=Y"
//                            , URLEncoder.encode(msg, charset));
                    query = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid="+senderId+"&dest_mobileno=" + mob + "&message=%s&response=Y"
                            , URLEncoder.encode(msg, charset));


//                    String query2 = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid=SARHAD&dest_mobileno=9712948736" + "&message=%s&response=Y"
//                            , URLEncoder.encode(msg, charset));
                    String query2 = String.format("http://www.smsjust.com/blank/sms/user/urlsms.php?username=SARHADDAIRYIT&pass=Sarhad@950&senderid="+senderId+"&dest_mobileno=9712948736" + "&message=%s&response=Y"
                            , URLEncoder.encode(msg, charset));

                    response = Unirest.post(query2).asString();
                    status = true;

                }else if (companyid == 228) {
                    //http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername=NEWMRT&smstype=TRANS&numbers=9722305857&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4
//                    String query2 = String.format("http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername=NEWMRT&smstype=TRANS&numbers="+mob+"&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4&response=Y"
//                            , URLEncoder.encode(msg, charset));
                	 String query2 = String.format("http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername="+senderId+"&smstype=TRANS&numbers="+mob+"&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4&response=Y"
                             , URLEncoder.encode(msg, charset));

                    log.info("JNM "+query2);
                    response = Unirest.post(query2).asString();
                    status = true;

                }else if (companyid == 450) {//gajanand 
                	//https://apps.vibgyortel.in/client/api/sendmessage?apikey=5ffbcc9a4d0bfad8&mobiles=9722305857&sms=Hello&senderid=GFPLTD
                	//http://sms.avisoft.co.in/sendSMS?username=anish_newmrt&message=%s&sendername=NEWMRT&smstype=TRANS&numbers="+mob+"&apikey=5bd080d8-1a1e-447e-911a-cf07b5a905b4&response=Y
                    System.err.println("HERE company id is 450");
                    String query2 ="";
                    if(msg.contains("You have received new"))
                    {
//                        query2 = String.format("https://apps.vibgyortel.in/client/api/sendmessage?apikey=5ffbcc9a4d0bfad8&mobiles="+mob+"&sms=%s&senderid=GFPLTD&dlt-entity-id=1701159473957285702&dlttemplate-id=1707161727806764611"
//                                , URLEncoder.encode(msg, charset));
                    	query2 = String.format("https://apps.vibgyortel.in/client/api/sendmessage?apikey=5ffbcc9a4d0bfad8&mobiles="+mob+"&sms=%s&senderid="+senderId+"&dlt-entity-id=1701159473957285702&dlttemplate-id=1707161727806764611"
                                , URLEncoder.encode(msg, charset));

                    }else if(msg.contains("Thank you for your purchase.")){
//                        query2 = String.format("https://apps.vibgyortel.in/client/api/sendmessage?apikey=5ffbcc9a4d0bfad8&mobiles="+mob+"&sms=%s&senderid=GFPLTD&dlt-entity-id=1701159473957285702&dlttemplate-id=1707162340662813416"
//                                , URLEncoder.encode(msg, charset));
                    	query2 = String.format("https://apps.vibgyortel.in/client/api/sendmessage?apikey=5ffbcc9a4d0bfad8&mobiles="+mob+"&sms=%s&senderid="+senderId+"&dlt-entity-id=1701159473957285702&dlttemplate-id=1707162340662813416"
                                , URLEncoder.encode(msg, charset));

                    }

                    log.info("JNM "+query2);
                    response = Unirest.post(query2).asString();
                    status = true;
                    System.err.println("HERE company id is 450"+response);

                } else {
                	 log.info("heree 22222222");
                    query = String.format("https://api.msg91.com/api/sendhttp.php?mobiles=" + mob + "&authkey=285406Aqd7jfrQL0N615c7cbcP1&route=4&sender=" + senderId + "&message=%s" + "&country=91&DLT_TE_ID="+TEMPLETE_ID+"\n"
                            , URLEncoder.encode(msg, charset));
                    response = Unirest.post(query).asString();
                }

                System.out.println(response + "::::::::::::::::::::::::::::::::::::::::::::::::" + response.getStatus());
                status = response.getStatus() == 200;
            } else {
                System.out.println("SMS NOT SEND NOT PERMISSION");
                status = false;
            }
        } catch (UnirestException e) {

            e.printStackTrace();
        } catch (Exception e) {
            // sTODO Auto-generated catch block
            e.printStackTrace();
        }


        return status;

    }

    @Value("${sms}")
    public void setSend(String s) {
        send = s;
    }


}