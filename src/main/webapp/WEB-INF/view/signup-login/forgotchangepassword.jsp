<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>Login | Vasy ERP</title>
    <link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet"
          type="text/css"/>

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
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <!-- begin::Body -->
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="login_form" action="/login"
                      method="post">

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
                                            <div class="m-login__head">
                                                <h3 class="m-login__title">
                                                    Forgot Password
                                                </h3>
                                                <div class="alert alert-danger alert-dismissible m--hide" id="inavlid"
                                                     style="margin-left: -2.2rem !important;margin-right: -2.2rem !important;">
                                                    <strong>invalid user name</strong>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m--margin-top-20">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group m-form__group row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <input type="text"
                                                           class="form-control form-control-lg m-input border-radius-9"
                                                           name="userName" id="userName" placeholder="User Name"/>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row m--margin-top-20">
                                        <div class="col-lg-12 col-md-12 col-sm-12 m--padding-left-30 m--padding-right-25">
                                            <a href="/login" id="m_login_forget_password"
                                               class="m-link m-link--state m--font-bold"
                                               style="color:#a399a2">
                                                <button type="submit"
                                                        class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9">
                                                    Sign in
                                                </button>
                                            </a>
                                            <button type="button"
                                                    class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9"
                                                    id="continue">Continue
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions m-form__actions--solid m-form__actions--right">
                                        <button type="submit" class="btn btn-brand" id="savecontact">
                                            Sign In
                                        </button>

                                    </div>
                                </div> -->
                            </div>
                            <!--end::Portlet-->
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
    <!-- end:: Body -->

</div>
<!-- end:: Page -->


<!--begin::Base Scripts -->
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<!--end::Base Scripts -->

<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>
<%@include file="otpmodel.jsp" %>
<%@include file="newpasswordmodel.jsp" %>
<script type="text/javascript">

    $("#login_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        icon: null,
        fields: {
            userName: {
                validators: {
                    notEmpty: {
                        message: 'The User Name is required. '
                    },
                    stringLength: {
                        max: 50,
                        message: 'The User Name Not More than 50 characters long. '
                    },

                }
            },
        }
    });

    $("#continue").click(function (i) {

        $.post("/forgotpasssword",
            {userName: $("#userName").val()}).done(function (data) {

            if (data == 'wrong') {
                $("#inavlid").removeClass("m--hide");
            }

            if (data == 'Sent') {
                $('#OTP_model').modal('show');
            }

        });

    });

    $("#userName").focus();

    function conform() {

        $.post("/otp/confirm",
            {
                otp: $("#otp").val()
            })
            .done(function (data) {

                if (data == "OTP matched succussfully") {

                    console.log(data);
                    $('#OTP_model').modal('hide');
                    toastr.info("OTP matched succussfully");
                    $('#new_password_model').modal('show');

                } else {

                    toastr.info("OTP is wrong");
                }
            });


    }

    function changepassword() {

        //$("#changepassword").attr("disabled", true);

        $.post("/newpassword",
            {
                //alert("hello");
                userName: $("#userName").val(),
                password: $("#password").val()
            }).done(function (data) {

            toastr.info("Your passsword has been Changed");

            setTimeout(
                function () {
                    window.location.replace("/login");
                }, 2000);

        });

    }


    /* forgot change password code */

    $("#login_form").formValidation(
        {
            framework: 'bootstrap',
            live: 'disabled',
            icon: null,
            fields: {
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
            }
        });

    $(document).ready(function () {
        console.log("hello");
        $('#changepassword').prop('disabled', true);
        checkPassword();

    });

    function checkPassword() {
        var password = $('#password').val();
        var newPassword = $('#confirmPassword').val();
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
</script>
</body>
<!-- end::Body -->
</html>