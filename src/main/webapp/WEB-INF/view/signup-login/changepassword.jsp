<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>Change Password | Vasy ERP</title>
    <link
            href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css"
            rel="stylesheet" type="text/css"/>

    <style type="text/css">
        .m-portlet-login {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .border-radius-9 {
            border-radius: 9px !important;
        }
    </style>
</head>
<!-- begin::Body -->
<body
        class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <!-- begin::Body -->
    <div
            class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <div class="m-content">
                <form
                        class="m-form m-form--state m-form--fit m-form--label-align-left"
                        id="changepassword_form" action="/changepassword" method="post">

                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-12 m-portlet-login">
                            <!--begin::Portlet-->
                            <div class="m-portlet border-radius-9"
                                 style="box-shadow: 0px 1px 15px 1px rgba(69, 65, 78, 0.11)">

                                <div class="m-portlet__body">
                                    <div class="m-login__container" style="text-align: center;">

                                        <%-- <div class="m-login__logo">
                                                <a href="#">
                                                    <img src="<%=request.getContextPath()%>/assets/app/media/img/logos/logo.png" style="width: 250px">
                                                </a>
                                            </div> --%>
                                        <div class="m-login__signin">
                                            <h3>Change Password</h3>
                                        </div>
                                    </div>

                                    <div class="row m--margin-top-20">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <input type="password"
                                                           class="form-control form-control-lg m-input border-radius-9"
                                                           name="oldpassword" id="oldpassword"
                                                           placeholder="Old Password" required/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12 m--margin-top-20">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <input type="password"
                                                           class="form-control form-control-lg m-input border-radius-9"
                                                           name="password" id="password" placeholder="New Password"
                                                           onChange="checkPassword()"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-12 col-md-12 col-sm-12 m--margin-top-20">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <input type="password"
                                                           class="form-control form-control-lg m-input border-radius-9"
                                                           name="confirmpassword" id="confirmpassword"
                                                           placeholder="Confirm New Password"
                                                           onKeyUp="checkPassword()"/>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- <div class="row m--margin-top-20">
                                        <div class="col-lg-12 col-md-12 col-sm-12 m--padding-left-20 m--padding-right-20">
                                            <button type="button" class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9"
                                                id="changepassword">Change Password</button>
                                        </div>
                                    </div> -->
                                    <div class="row m--margin-top-20">
                                        <div class="col-lg-6">
                                            <div
                                                    class="col-lg-12 col-md-12 col-sm-12 m--padding-left-50 m--padding-right-10">
                                                <button type="button"
                                                        class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9"
                                                        id="changepassword">Submit
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div
                                                    class="col-lg-12 col-md-12 col-sm-12 m--padding-left-16 m--padding-right-95">
                                                <a href="<%=request.getContextPath()%>/dashboard"
                                                   id="m_login_forget_password"
                                                   class="btn btn-secondary btn-lg m-btn m-btn--custom pull-right border-radius-9"
                                                   style="color: #a399a2">Cancel</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!--end::Portlet-->
                    </div>
                </form>
            </div>

        </div>

    </div>
    <!-- end:: Body -->

</div>
<!-- end:: Page -->


<!--begin::Base Scripts -->
<script
        src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js"
        type="text/javascript"></script>
<script
        src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js"
        type="text/javascript"></script>
<!--end::Base Scripts -->

<script
        src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script
        src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script type="text/javascript">
    $("#changepassword_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',

        icon: null,
        fields: {
            oldpassword: {
                validators: {
                    notEmpty: {
                        message: 'The Password is required. '
                    },
                    stringLength: {
                        max: 50,
                        message: 'The Password must be 50 digit long. '
                    },
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The Password is required. '
                    },
                    stringLength: {
                        max: 50,
                        message: 'The Password must be 50 digit long. '
                    },
                }
            },
            confirmpassword: {
                validators: {
                    notEmpty: {
                        message: 'The Password is required. '
                    },
                    stringLength: {
                        max: 50,
                        message: 'The Password must be 50 digit long. '
                    },
                }
            },
        }
    });

  /*   $(".close").click(function () {
        window.location = "/login";
    }); */

    $("#userName").focus();

    $(document).ready(function () {
        console.log();
        $('#changepassword').prop('disabled', true);
        checkPassword();
       

    });
    
    $('.m-input').keypress(function (e) {
    	  if (e.which == 13) {
        	  console.log("enter keyyyyy")
    		  savePassword();
    	  }
    	});
    function checkPassword() {
        var password = $('#password').val();
        var newPassword = $('#confirmpassword').val();
        if (password != '') {
        if(password.length<8){
        	
        	toastr.error("The Password must be at least 8 characters long")
        }else{
	        if (password != '' && password == newPassword) {
	            $('#changepassword').prop('disabled', false);
	
	        } else {
	            $('#changepassword').prop('disabled', true);
	
	        }
        }
        }
    }

    $('#changepassword').click(function () {
    	savePassword();
    });
  function savePassword(){
	  console.log("enter keyyyyy presss")
    	 $.post("/changepassword/save", {
             oldpassword: $("#oldpassword").val(),
             password: $("#password").val(),
             confirmpassword: $("#confirmpassword").val()
         }).done(function (data) {

             console.log(data);
             if (data == "success") {
                 toastr.info("password changed successfully");
                 window.location.replace("/logout");

             } else {

                 toastr.info("sorry , Your current password is wrong  ");
             }
         });
        }
</script>
</body>
<!-- end::Body -->
</html>