<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.erp.mterp.constant.Constant" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en" class="html--signin">

<head>

    <%@include file="../header/head.jsp" %>

    <title>Login | Vasy ERP</title>
    <link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet"
          type="text/css"/>

    <style type="text/css">
    	::-webkit-input-placeholder, ::placeholder, .form-control{font-family: Poppins;}
    	.fa-user, .fa-lock{position:absolute;bottom:13px;left:25px;}
    	.bg-img{background-image: url(/images/login-3.png);background-size:cover;background-repeate:no-repeate;}
        .m-portlet-login {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .border-radius-9 {
            border-radius: 9px !important;
        }

        .top {
            padding-top: 10px;
        }

    </style>
</head>
<!-- begin::Body -->
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <!-- begin::Body -->
    <div class="bg-img m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="signup_form" action="/signup/save"
                      method="post">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 m-portlet-login">
                            <!--begin::Portlet-->
                            <div class="m-portlet border-radius-9"
                                 style="box-shadow: 0px 1px 15px 1px rgba(69, 65, 78, 0.11);margin-bottom:0px;">
                                <div class="m-portlet__body">
                                    <div class="m-login__container" style="text-align: center;">
                                        
                                    </div>
                                    <div class="row m--margin-top-20">
                                    	<div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group m-form__group row p-0">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                	<label class="font-weight-semibold" for="name">Name:</label>
                                                	<i class="fa fa-user" aria-hidden="true"></i>
                                                    <input type="text"
                                                           class="form-control form-control-md m-input"  style="border-radius:5px;padding-left:35px;"
                                                           name="name" id="name" placeholder="Name"/>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" name="hostName" id="hostName">

										<div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group m-form__group row p-0">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                	<label class="font-weight-semibold" for="userName">User Name:</label>
                                                	<i class="fa fa-user" aria-hidden="true"></i>
                                                    <input type="text"
                                                           class="form-control form-control-md m-input"  style="border-radius:5px;padding-left:35px;"
                                                           name="userName" id="userName" placeholder="User Name"/>
                                                </div>
                                            </div>
                                        </div>   
																						
                                        <div class="col-lg-12 col-md-12 col-sm-12 m--margin-top-20">
                                            <div class="form-group m-form__group row p-0">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                	<label class="font-weight-semibold" for="password">Password:</label>
                                                	<i class="fa fa-lock" aria-hidden="true"></i>
                                                    <input type="password"
                                                           class="form-control form-control-md m-input"  style="border-radius:5px;padding-left:35px;"
                                                           name="password" id="password" placeholder="Password"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--  another design  -->

                                    <!-- <div class="row m--margin-top-20 " >
                                        <div class="col-lg-12 col-md-12 col-sm-12 m--padding-left-30 m--padding-right-25">
                                            <a href="/login/forgotpasssword" id="m_login_forget_password" class="m-link m-link--state m--font-bold top" style="color:#a399a2">Forget Password ?</a>
                                            <button type="submit" class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9">Sign In</button>
                                        </div>
                                    </div>

                                    <div class="row m--margin-top-5 text-center " >
                                    style="margin-left: 80px;"
                                        <div class="col-lg-12 col-md-12 col-sm-12 m--padding-left-30 m--padding-right-25">
                                            Don't have an account yet ?   <a href="/signup" id="m_login_forget_password" class="m-link m-link--state m--font-bold" style="color:#5867dd"> Sign Up</a>
                                        </div>
                                    </div>
                                </div> -->

                                    <!-- <div class="m-portlet__foot m-portlet__foot--fit">
                                        <div class="m-form__actions m-form__actions--solid m-form__actions--right">
                                            <button type="submit" class="btn btn-brand" id="savecontact">
                                                Sign In
                                            </button>

                                        </div>
                                    </div> -->


                                    <!--  trying  -->

                                    <div class="row m--margin-top-10  signinbutton ">

                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-4" style="align:center;">
                                                    <button type="submit"
                                                            class="btn btn-primary btn-md m-btn m-btn--custom pull-right button" style="border-radius:5px;">
                                                        Sign Up
                                                    </button>
                                                </div>
                                            </div>
                                        </div>


                                        <!-- <div class="col-lg-12 col-md-12 col-sm-12 " style="margin-left: -180px;">
                                            <button type="submit" class="btn btn-primary btn-lg m-btn m-btn--custom pull-right border-radius-9 button" >Sign In</button>
                                        </div> -->
                                    </div>

                                    <div class="row m--margin-top-15  text-center" style="margin-right:25px;"></div>

                                    <!--  ///trying  -->

                                </div>


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

<script type="text/javascript">

    $("#signup_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        /* button:{
            selector : "#savecontact",
            disabled : "disabled",
        }, */
        icon: null,
        fields: {
        	name: {
                validators: {
                    notEmpty: {
                        message: 'The name is required. '
                    }/* ,
						stringLength : {
							max : 50,
							message : 'The User Name Not More than 50 characters long. '
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_-\s-]+$/,
							message : 'The User Name can only consist of alphabetical, numberical value. '
						}, */
                }
            },
        	userName: {
                validators: {
                    notEmpty: {
                        message: 'The User Name is required. '
                    },
		             remote: {
		                message: 'This User Name is already exist',
		                url: "/checkusername",
		                type: 'POST'
		            } 
            /* ,
						stringLength : {
							max : 50,
							message : 'The User Name Not More than 50 characters long. '
						},
						regexp : {
							regexp : /^[a-zA-Z0-9_-\s-]+$/,
							message : 'The User Name can only consist of alphabetical, numberical value. '
						}, */
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
        }
    });

    $(".close").click(function () {
        window.location = "/signup";
    });

    $("#userName").focus();


    jQuery(document).ready(function () {
    	sessionStorage.clear();


        $("#hostName").val($(location).attr('hostname'));


    });

</script>
</body>

</html>