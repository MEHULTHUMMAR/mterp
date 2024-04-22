<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>
<c:forEach items="${ProfileDetail}" var="ProfileDetail">
    <head>

        <%@include file="../header/head.jsp" %>

        <title>${ProfileDetail.name} | Profile</title>

        <style type="text/css">
            .select2-container {
                display: block;
            }
        </style>

        <style>
            div.scrollmenu {

                overflow-x: auto;
                /* white-space: pre-wrap; */
                padding: 0 !important;
            }

            div.scrollmenu table {
                /* display: inline-block; */

            }

            /* tr input {
                border: none !important;
            }

            tr input:hover {
                border: 1px solid #ced4da !important;

            }
            tr input:focus {
                border: 1px solid #ced4da !important;

            } */
        </style>

    </head>
    <%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/framework/bootstrap.min.css"> --%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/dist/bootstrap-tagsinput.css">

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
                            <h3 class="m-subheader__title m-subheader__title--separator">${ProfileDetail.name} |
                                Profile</h3>

                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home">
                                    <a href="/" class="m-nav__link m-nav__link--icon">
                                        <i class="m-nav__link-icon la la-home"></i>
                                    </a>
                                </li>
                                <li class="m-nav__separator">-</li>
                                <li class="m-nav__item">
                                    <a href="/profile" class="m-nav__link">
                                        <span class="m-nav__link-text">Profile</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- END: Subheader -->

                <div class="m-content">

                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <!--begin::Portlet-->
                                    <div class="m-portlet">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
													<span class="m-portlet__head-icon">
														<i class="flaticon-cogwheel-2"></i>
													</span>
                                                    <h3 class="m-portlet__head-text m--font-brand">
                                                        Logo
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="m-portlet__head-tools">
                                                <ul class="m-portlet__nav">
                                                    <li class="m-portlet__nav-item m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push"
                                                        m-dropdown-toggle="hover">
                                                        <a href="#"
                                                           class="m-portlet__nav-link m-portlet__nav-link--icon m-portlet__nav-link--icon-xl  m-dropdown__toggle">
                                                            <!-- <i class="la la-ellipsis-v"></i> -->
                                                            <i class="la la-ellipsis-h m--font-brand"></i>
                                                        </a>
                                                        <div class="m-dropdown__wrapper">
                                                            <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                                            <div class="m-dropdown__inner">
                                                                <div class="m-dropdown__body">
                                                                    <div class="m-dropdown__content">
                                                                        <ul class="m-nav">

                                                                            <li class="m-nav__item">
                                                                                <a href="/profile/${ProfileDetail.userFrontId}/edit"
                                                                                   class="btn btn-outline-info m-btn m-btn--custom m-btn--icon m-btn--pill btn-sm">
                                                                                    <span><i
                                                                                            class="flaticon-edit"></i><span>Edit</span></span>
                                                                                </a>

                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-4 col-md-4 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <c:if test="${empty ProfileDetail.logo}">
                                                                <img src="/No-image-found.jpg" width="120" height="80">
                                                            </c:if>
                                                            <c:if test="${not empty ProfileDetail.logo}">
                                                                <img id="logoofprofile"
                                                                     src="${sessionScope.realPath}${ProfileDetail.logo}"
                                                                     width="120" height="80">
                                                            </c:if>


                                                        </tr>
                                                        <br/>
                                                        <tr class="row">
                                                            <a href="" data-toggle="modal" data-target="#changeLogo">change
                                                                logo</a>
                                                            <c:if test="${not empty ProfileDetail.logo}">
                                                                </br>
                                                                <a href="#" id="logoofprofileA"
                                                                   onclick="removeLogo(${ProfileDetail.userFrontId})">Remove
                                                                    logo</a>
                                                            </c:if>

                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <c:if test="${empty ProfileDetail.watermark}">
                                                                <img src="/No-image-found.jpg" width="120" height="80">
                                                            </c:if>
                                                            <c:if test="${not empty ProfileDetail.watermark}">
                                                                <img id="logoofwatermark"
                                                                     src="${sessionScope.realPath}${ProfileDetail.watermark}"
                                                                     width="120" height="80">
                                                            </c:if>
                                                        </tr>
                                                        <br/>
                                                        <tr class="row">
                                                            <a href="" data-toggle="modal"
                                                               data-target="#changewatermark">Change Water Mark</a>
                                                            </br>
                                                            <c:if test="${not empty ProfileDetail.watermark}">
                                                                <a href="#" id="logoofwatermarkA"
                                                                   onclick="removeWaterMark(${ProfileDetail.userFrontId})">Remove
                                                                    Water Mark</a>
                                                            </c:if>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-12">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <c:if test="${empty ProfileDetail.banner}">
                                                                <img src="/No-image-found.jpg" width="120" height="80">
                                                            </c:if>
                                                            <c:if test="${not empty ProfileDetail.banner}">
                                                                <img id="logoofbanner"
                                                                     src="${sessionScope.realPath}${ProfileDetail.banner}"
                                                                     width="120" height="80">
                                                            </c:if>
                                                        </tr>
                                                        <br/>
                                                        <tr class="row">
                                                            <a href="" data-toggle="modal"
                                                               data-target="#changebanner">Change self kiosk Banner</a>
                                                            </br>
                                                            <c:if test="${not empty ProfileDetail.banner}">
                                                                <a href="#" id="logoofbannerA"
                                                                   onclick="removeWaterMark(${ProfileDetail.userFrontId})">Remove
                                                                    self kiosk Banner</a>
                                                            </c:if>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-4 col-md-4 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <c:if test="${empty ProfileDetail.thermalLogo}">
                                                                <img src="/No-image-found.jpg" width="120" height="80">
                                                            </c:if>
                                                            <c:if test="${not empty ProfileDetail.thermalLogo}">
                                                                <img id="logoofthermal"
                                                                     src="${sessionScope.realPath}${ProfileDetail.thermalLogo}"
                                                                     width="120" height="80">
                                                            </c:if>


                                                        </tr>
                                                        <br/>
                                                        <tr class="row">
                                                            <a href="" data-toggle="modal" data-target="#changeThermalLogo">change Thermal Print
                                                                logo</a>
                                                            <c:if test="${not empty ProfileDetail.thermalLogo}">
                                                                </br>
                                                                <a href="#" id="logoofthermalA"
                                                                   onclick="removeThermalLogo(${ProfileDetail.userFrontId})">Remove
                                                                    logo</a>
                                                            </c:if> 

                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                </div>
                                               
                                        </div>

                                    </div>
                                    <!--end::Portlet-->
                                </div>

                            </div>


                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <!--begin::Portlet-->
                                    <div class="m-portlet">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
													<span class="m-portlet__head-icon">
														<i class="flaticon-cogwheel-2"></i>
													</span>
                                                    <h3 class="m-portlet__head-text m--font-brand">
                                                        Profile Details
                                                    </h3>
                                                </div>
                                            </div>
                                            <div class="m-portlet__head-tools">
                                                <ul class="m-portlet__nav">

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.name}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Contact
                                                                Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.contactName}</td>
                                                        </tr>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Owner
                                                                No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.ownerNo}</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Email:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.email}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Mobile
                                                                No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.contactNo}</td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!--end::Portlet-->
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <!--begin::Portlet-->
                                    <div class="m-portlet">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
													<span class="m-portlet__head-icon">
														<i class="flaticon-cogwheel-2"></i>
													</span>
                                                    <h3 class="m-portlet__head-text m--font-brand">
                                                        Address Details
                                                    </h3>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                Address:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.address}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">City:
                                                            </th>
                                                            <c:forEach items="${CityList}"
                                                                       var="CityList">
                                                                <c:if
                                                                        test="${CityList.cityCode == ProfileDetail.cityCode}">
                                                                    <td class="col-lg-8 col-md-8 col-sm-12">${CityList.cityName}</td>
                                                                </c:if>
                                                            </c:forEach>

                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                Country:
                                                            </th>
                                                            <c:forEach items="${CountryList}"
                                                                       var="CountryList">
                                                                <c:if
                                                                        test="${CountryList.countriesCode == ProfileDetail.countriesCode}">
                                                                    <td class="col-lg-8 col-md-8 col-sm-12">${CountryList.countriesName}</td>
                                                                </c:if>

                                                            </c:forEach>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Pin
                                                                Code:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.pincode}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">State:
                                                            </th>
                                                            <c:forEach items="${StateList}"
                                                                       var="StateList">
                                                                <c:if test
                                                                              ="${StateList.stateCode == ProfileDetail.stateCode}">
                                                                    <td class="col-lg-8 col-md-8 col-sm-12">${StateList.stateName}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!--end::Portlet-->
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <!--begin::Portlet-->
                                    <div class="m-portlet">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
													<span class="m-portlet__head-icon">
														<i class="flaticon-cogwheel-2"></i>
													</span>
                                                    <h3 class="m-portlet__head-text m--font-brand">
                                                        Bank Details
                                                    </h3>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Bank
                                                                Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.bankName}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Bank
                                                                Ifsc:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.bankIFSC}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">UPI:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.companyUpi}</td>
                                                        </tr>


                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Branch
                                                                Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.bankBranch}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Bank
                                                                Account No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.bankAcno}</td>
                                                        </tr>
                                                        <c:if test="${not empty ProfileDetail.companyUpi}">
                                                            <tr class="row">
                                                                <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                    <a href="/profile/upi/stand/download"
                                                                       class="m-list-search__result-item">
                                                                        <span class="m-list-search__result-item-text">Download UPI Stand</span>
                                                                    </a>

                                                                </th>
                                                                <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                    <a href="/profile/orderlink/stand"
                                                                       class="m-list-search__result-item">
                                                                        <span class="m-list-search__result-item-text">Order Link Stand</span>
                                                                    </a>

                                                                </th>
                                                            </tr>
                                                        </c:if>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!--end::Portlet-->
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <!--begin::Portlet-->
                                    <div class="m-portlet">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
													<span class="m-portlet__head-icon">
														<i class="flaticon-cogwheel-2"></i>
													</span>
                                                    <h3 class="m-portlet__head-text m--font-brand">
                                                        Other Details
                                                    </h3>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">User
                                                                Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.userName}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                Customer Care No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.telephone}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">GST
                                                                Registration Type:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.gstRegistrationType}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">GSTIN:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.gst}</td>
                                                        </tr>

                                                        <c:if test="${ProfileDetail.haveFssaiNo==1}">
                                                            <tr class="row">
                                                                <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                    FSSAI NO.:
                                                                </th>
                                                                <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.fssaiNo}</td>
                                                            </tr>
                                                        </c:if>

                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Pan
                                                                No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.panNo}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Web
                                                                Site:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.website}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">
                                                                Financial Month Interval:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.monthInterval}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Default
                                                                Financial year:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${ProfileDetail.defaultYearInterval}</td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <!--end::Portlet-->
                                </div>

                            </div>

                        </div>

                    </div>
                </div>

            </div>

        </div>
        <!-- end:: Body -->

        <!-- Include Footer -->
        <%@include file="../footer/footer.jsp" %>
        <%@include file="change_logo.jsp" %>
        <%@include file="change_watermark.jsp" %>
        <%@include file="change_banner.jsp" %>
         <%@include file="change_thermal_logo.jsp" %>
    </div>
    <!-- end:: Page -->

    <!--begin::Base Scripts -->
    <script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js"
            type="text/javascript"></script>
    <script src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>
    <%@include file="../global/global-script.jsp" %>

    <!--end::Base Scripts -->

    <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js"
            type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
            type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-select.js"
            type="text/javascript"></script>

    <script src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/formValidation.min.js"
            type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/assets/vendors/custom/formvalidation/framework/bootstrap.min.js"></script>
    <!-- Form Validation -->
    <script>

        $(document).ready(function () {
            var num = Math.random();

            $(function () {
                var s = "${sessionScope.realPath}${ProfileDetail.logo}";
                //	s=s.concat(${ProfileDetail.logo});
                var imgSrc = s;
                console.log(imgSrc)
                $('#logoofprofile').attr("src", imgSrc);
            })

            $("#file").on("change", function () {
                var fileExtension = ['jpeg', 'jpg', 'png', 'bmp'];

                if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
//                	alert("Only '.jpeg','.jpg', '.png', '.bmp' formats are allowed.");	
                    $("#file_error").html("Only '.jpeg','.jpg', '.png', '.bmp' formats are allowed.");

                    $("#file_error").html(($("#file").val()));

                    $("#file_error").val(this.value.substring(this.value.lastIndexOf("\\") + 1));

                } else {
                    $("#file_error").html("");

                    var file = this.files[0],
                        fileName = file.name,
                        fileSize = file.size;

                    if (fileSize > 10000000) {
                        $("#file_error").html("File size is greater than 10MB");
                        $("#file").val("");
                    }

                }

            });
        });

        function removeLogo(id) {

            var u = "/profile/" + id + "/logoremove"

            swal({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                type: "warning",
                showCancelButton: !0,
                confirmButtonText: "Yes, delete it!"
            }).then(
                function (e) {
                    if (e.value) {
                        $.post(u, function (data) {
                            if (data == "true") {
                                $('#logoofprofile').attr("src", "/No-image-found.jpg");
                                $('#logoofprofileA').remove();
                                toastr.success("Logo Removed");
                            } else {
                                toastr.error("Somthing Went To Wrong");
                            }
                        });

                    }

                })

        }

        function removeWaterMark(id) {

            var u = "/profile/" + id + "/watermarkremove"

            swal({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                type: "warning",
                showCancelButton: !0,
                confirmButtonText: "Yes, delete it!"
            }).then(
                function (e) {
                    if (e.value) {
                        $.post(u, function (data) {
                            if (data == "true") {
                                $('#logoofwatermark').attr("src", "/No-image-found.jpg");
                                $('#logoofwatermarkA').remove();
                                toastr.success("Water Mark Removed");
                            } else {
                                toastr.error("Somthing Went To Wrong");
                            }
                        });

                    }

                })

        }
        function removeThermalLogo(id) {

            var u = "/profile/" + id + "/thermallogoremove"

            swal({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                type: "warning",
                showCancelButton: !0,
                confirmButtonText: "Yes, delete it!"
            }).then(
                function (e) {
                    if (e.value) {
                        $.post(u, function (data) {
                            if (data == "true") {
                                $('#logoofthermal').attr("src", "/No-image-found.jpg");
                                $('#logoofthermalA').remove();
                                toastr.success("thermal Removed");
                            } else {
                                toastr.error("Somthing Went To Wrong");
                            }
                        });

                    }

                })

        }

    </script>
    </body>
</c:forEach>
<!-- end::Body -->
</html>




