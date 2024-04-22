<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>Login | Patidaar Sales</title>

</head>

<!-- begin::Body -->
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">

    <!-- begin::Body -->
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--hor m-login m-login--signin m-login--2 m-login-2--skin-1"
         id="m_login" style="background-image: url(<%=request.getContextPath()%>/assets/app/media/img/bg/bg-1.jpg);">
        <div class="m-grid__item m-grid__item--fluid m-login__wrapper">
            <div class="m-login__container">
                <div class="m-login__logo">
                    <a href="#">
                        <%-- <img src="<%=request.getContextPath()%>/assets/app/media/img/logos/logo-1.png"> --%>
                    </a>
                </div>
                <div class="m-login__signin">
                    <div class="m-login__head">
                        <h3 class="m-login__title">
                            Sign In
                        </h3>
                    </div>
                    <form class="m-login__form m-form" action="/login" method="post">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="User Name" name="userName"
                                   autocomplete="off">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input m-login__form-input--last" type="password"
                                   placeholder="Password" name="password">
                        </div>
                        <div class="row m-login__form-sub">
                            <div class="col m--align-left m-login__form-left">
                                <label class="m-checkbox  m-checkbox--light">
                                    <input type="checkbox" name="remember-me">
                                    Remember me
                                    <span></span>
                                </label>
                            </div>
                            <div class="col m--align-right m-login__form-right m--hide">
                                <a href="javascript:;" id="m_login_forget_password" class="m-link">
                                    Forget Password ?
                                </a>
                            </div>
                        </div>
                        <div class="m-login__form-action">
                            <button type="submit" id=""
                                    class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn m-login__btn--primary">
                                Sign In
                            </button>
                        </div>
                    </form>
                </div>
                <div class="m-login__signup m--hide">
                    <div class="m-login__head">
                        <h3 class="m-login__title">
                            Sign Up
                        </h3>
                        <div class="m-login__desc">
                            Enter your details to create your account:
                        </div>
                    </div>
                    <form class="m-login__form m-form" action="">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="Fullname" name="fullname">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="Email" name="email"
                                   autocomplete="off">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="password" placeholder="Password" name="password">
                        </div>
                        <div class="form-group m-form__group">
                            <input class="form-control m-input m-login__form-input--last" type="password"
                                   placeholder="Confirm Password" name="rpassword">
                        </div>
                        <div class="row form-group m-form__group m-login__form-sub">
                            <div class="col m--align-left">
                                <label class="m-checkbox m-checkbox--light">
                                    <input type="checkbox" name="agree">
                                    I Agree the
                                    <a href="#" class="m-link m-link--focus">
                                        terms and conditions
                                    </a>
                                    .
                                    <span></span>
                                </label>
                                <span class="m-form__help"></span>
                            </div>
                        </div>
                        <div class="m-login__form-action">
                            <button id="m_login_signup_submit"
                                    class="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">
                                Sign Up
                            </button>
                            &nbsp;&nbsp;
                            <button id="m_login_signup_cancel"
                                    class="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn">
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
                <div class="m-login__forget-password m--hide">
                    <div class="m-login__head">
                        <h3 class="m-login__title">
                            Forgotten Password ?
                        </h3>
                        <div class="m-login__desc">
                            Enter your User Name to reset your password:
                        </div>
                    </div>
                    <form class="m-login__form m-form" action="">
                        <div class="form-group m-form__group">
                            <input class="form-control m-input" type="text" placeholder="User Name" name=""
                                   id="m_forget_username" autocomplete="off">
                        </div>
                        <div class="m-login__form-action">
                            <button id="m_login_forget_password_submit"
                                    class="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">
                                Request
                            </button>
                            &nbsp;&nbsp;
                            <button id="m_login_forget_password_cancel"
                                    class="btn m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn">
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
                <div class="m-login__account m--hide">
						<span class="m-login__account-msg">
							Don't have an account yet ?
						</span>
                    &nbsp;&nbsp;
                    <a href="javascript:;" id="m_login_signup" class="m-link m-link--light m-login__account-link">
                        Sign Up
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- end:: Body -->

</div>
<!-- end:: Page -->

<!--begin::Base Scripts -->
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<script src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>
<%@include file="../global/global-script.jsp" %>

<!--end::Base Scripts -->

<!--begin::Page Snippets -->
<script src="<%=request.getContextPath()%>/assets/snippets/custom/pages/user/login.js" type="text/javascript"></script>
<!--end::Page Snippets -->
<script type="text/javascript">
    $(document).ready(function () {
        $("#m_login_forget_password_submit").click(function (i) {
            alert("d")
            $.post("/login/forgotpasssword", {userName: $("#m_forget_username").val()})
                .done(function (data) {
                    alert(data);
                });

        });
    });
</script>
</body>
<!-- end::Body -->
</html>