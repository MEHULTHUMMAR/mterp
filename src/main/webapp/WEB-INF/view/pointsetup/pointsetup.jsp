<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.erp.mterp.constant.Constant" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- <c:if test="${LoyaltyDetail.size()!=0}">
	<c:forEach items="${LoyaltyDetail}" var="LoyaltyDetail"> 
</c:if> --%>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Point Setup</title>

    <style type="text/css">
        .select2-container {
            display: block;
        }

        .sync_button {
            position: relative !important;
            top: 50% !important;
            left: 0% !important;
        }
    </style>
</head>

<!-- begin::Body -->
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">
    <!-- Include Header -->
    <%@include file="../header/header.jsp" %>

    <!-- begin::Body -->
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <!-- Include Navigation -->
        <%@include file="../header/navigation.jsp" %>

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <!-- BEGIN: Subheader -->
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">Point Setup</h3>

                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="/" class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <!-- END: Subheader -->

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="loyalty_setup_form"
                      action="/pointsetup/create" method="post">
                    <input type="hidden" name="pointSetupId" id="pointSetupId" value="${pointSetupId}"/>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <!--begin::Portlet-->
                            <div class="m-portlet row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="m-portlet__body">
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                <div class="form-group m-form__group row  m--padding-left-0">
                                                    <label class="col-form-label col-lg-12 col-md-12 col-sm-12">1 Point Equals Rs:<span style="font-size:1.25rem; color:red;" class="text-danger">*</span></label>
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <input type="text" class="form-control m-input" name="pointRs" id="pointRs" placeholder="Rs" value="${pointRs}">
                                                    </div>
                                                </div>
                                            </div>

                                            
                                            
                                        </div>
                                    </div>
                                </div>

                                
                                <!--end::Portlet-->
                            </div>

                        </div>

                    </div>
                   <div class="m-portlet__foot m-portlet__foot--fit">
                        <div class="m-form__actions m-form__actions--solid m-form__actions--right">
                            <button type="submit" class="btn btn-brand" id="save_branch">
                                Submit
                            </button>
						</div>
                    </div>
                </form>
            </div>

        </div>

    </div>
    <!-- end:: Body -->

    <!-- Include Footer -->
    <%@include file="../footer/footer.jsp" %>

</div>
<!-- end:: Page -->

<!--begin::Base Scripts -->
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<%@include file="../global/global-script.jsp" %>
<script>
    
    $(document).ready(function () {

      

    });


</script>

</body>
<!-- end::Body -->
<%-- <c:if test="${LoyaltyDetail.size()!=0}">
	</c:forEach >
</c:if> --%>
</html>