<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:forEach items="${ProfileDetail}" var="ProfileDetail">
    <head>

        <%@include file="../header/head.jsp" %>

        <title>${ProfileDetail.name}| Edit | Profile</title>

        <style type="text/css">
            .select2-container {
                display: block;
            }
        </style>
    </head>

    <!-- begin::Body -->
    <body data-submit="#save_profile" data-cancel="#canecl_profile"
          class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <!-- Include Header -->
        <%@include file="../header/header.jsp" %>

        <!-- begin::Body -->
        <div
                class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

            <!-- Include Navigation -->
            <%@include file="../header/navigation.jsp" %>

            <div class="m-grid__item m-grid__item--fluid m-wrapper">

                <!-- BEGIN: Subheader -->
                <div class="m-subheader ">
                    <div class="d-flex align-items-center">
                        <div class="mr-auto">
                            <h3 class="m-subheader__title m-subheader__title--separator">Edit
                                Profile | ${ProfileDetail.userFrontId}</h3>

                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home"><a href="/"
                                                                             class="m-nav__link m-nav__link--icon"> <i
                                        class="m-nav__link-icon la la-home"></i>
                                </a></li>
                                <li class="m-nav__separator">-</li>
                                <li class="m-nav__item"><a href="/profile/"
                                                           class="m-nav__link"> <span
                                        class="m-nav__link-text">Profile</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- END: Subheader -->

                <div class="m-content">
                    <form
                            class="m-form m-form--state m-form--fit m-form--label-align-left"
                            id="profile_edit" action="/profile/create" method="post">
                        <input type="hidden" name="userFrontId" id="userFrontId"
                               value="${ProfileDetail.userFrontId}"/>

                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <!--begin::Portlet-->
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
															<span class="m-portlet__head-icon"> <i
                                                                    class="flaticon-cogwheel-2"></i>
															</span>
                                                        <h3 class="m-portlet__head-text m--font-brand">
                                                            Profile Details</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <!-- company id hidden field -->


                                                        <div
                                                                class="form-group m-form__group row  m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                                                Name:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       autofocus name="name" id="name"
                                                                       placeholder="Name"
                                                                       value="${ProfileDetail.name}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Contact
                                                                Name:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       id="contactName" name="contactName"
                                                                       placeholder="Contact Name"
                                                                       value="${ProfileDetail.contactName} ">
                                                            </div>
                                                        </div>
                                                        <input type="hidden" name="totalnumber" id="totalnumber"
                                                               value=${totalnumber}>
                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0 edit-example">

                                                            <div class="col-lg-12 col-md-12 col-sm-12 r-group">
                                                                    <%-- <input type="text" class="form-control m-input"
                                                                        name="ownerNo" id="ownerNo" placeholder="Owner No"
                                                                        value="${ProfileDetail.ownerNo}">  --%>
                                                                <input
                                                                        type="hidden" name="ownernolist[0].id"
                                                                        id="ownernolist_0_id"
                                                                        data-pattern-name="ownernolist[++].id"
                                                                        data-pattern-id="ownernolist_++_id"/>
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">Owner
                                                                    No:</label>
                                                                <input type="text"
                                                                       class="form-control m-input"
                                                                       name="ownernolist[0]"
                                                                       id="ownerlist_0"
                                                                       data-pattern-name="ownernolist[++]"
                                                                       data-pattern-id="ownernolist_++"
                                                                       style="width:90%;"/>
                                                                <a href="#" id="closeowner" data-repeater-delete=""
                                                                   data-toggle="modal"
                                                                   class="m-portlet__nav-link btn btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--custom m-btn--pill m-btn--air r-btnRemove"
                                                                   style="width: 20px;height: 20px;">
                                                                    <i class="la la-close"></i>
                                                                </a>
                                                                <!-- <button type="button" class="r-btnRemove">Remove -</button> -->

                                                            </div>
                                                            <a href="#" id="addowner" data-toggle="modal"
                                                               data-toggel="modal" data-repeater-create=""
                                                               class="m-link m--font-boldest r-btnAdd"
                                                               style="padding-top: 11px; margin-left: 18px;">Add More
                                                            </a>
                                                            <!-- <button type="button" class="r-btnAdd">Add new</button> -->
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Email:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-8">
                                                                <input type="text" class="form-control m-input"
                                                                       name="email" id="email" placeholder="Email"
                                                                       value="${ProfileDetail.email}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Mobile
                                                                No:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       name="contactNo" id="mobileNo"
                                                                       placeholder="Mob No"
                                                                       value="${ProfileDetail.contactNo}">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end::Portlet-->
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12"
                                         id="address_repeater">
                                        <div data-repeater-list="">

                                            <!--begin::Portlet-->
                                            <div class="m-portlet" data-repeater-item>
                                                <div class="m-portlet__head">
                                                    <div class="m-portlet__head-caption">
                                                        <div class="m-portlet__head-title">
																<span class="m-portlet__head-icon"> <i
                                                                        class="flaticon-cogwheel-2"></i>
																</span>
                                                            <h3 class="m-portlet__head-text m--font-brand">
                                                                Address Details</h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="m-portlet__body">

                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-12">

                                                            <div
                                                                    class="form-group m-form__group row  m--padding-left-0">
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">Address:</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <input type="text" class="form-control m-input"
                                                                           name="address" placeholder="Address "
                                                                           value="${ProfileDetail.address}">
                                                                </div>
                                                            </div>

                                                            <div
                                                                    class="form-group m-form__group row  m--padding-left-0">
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">Select
                                                                    Country:</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <select class="form-control m-select2 "
                                                                            id="countriesCode"
                                                                            data-default="${ProfileDetail.countriesCode}"
                                                                            name="countriesCode"
                                                                            onchange="getAllStateAjax('countriesCode','stateCode')"
                                                                            placeholder="Select Country"
                                                                            data-allow-clear="true">

                                                                    </select>
                                                                </div>
                                                            </div>


                                                            <div
                                                                    class="form-group m-form__group row  m--padding-left-0">
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">Select
                                                                    State:</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <select class="form-control m-select2"
                                                                            id="stateCode"
                                                                            name="stateCode"
                                                                            data-default="${ProfileDetail.stateCode}"
                                                                            onchange="getAllCityAjax('stateCode','cityCode')"
                                                                            data-allow-clear="false"
                                                                            placeholder="Select State">

                                                                    </select>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="col-lg-6 col-md-6 col-sm-12">

                                                            <div
                                                                    class="form-group m-form__group row  m--padding-left-0">
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">Select
                                                                    City:</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <select class="form-control m-select2" id="cityCode"
                                                                            name="cityCode"
                                                                            data-default="${ProfileDetail.cityCode}"
                                                                            placeholder="Select City"
                                                                            data-allow-clear="true">

                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div
                                                                    class="form-group m-form__group row  m--padding-left-0">
                                                                <label
                                                                        class="col-form-label col-lg-12 col-md-12 col-sm-12">ZIP/Postal
                                                                    code:</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <input type="text" class="form-control m-input"
                                                                           name="pincode" id="pinCode"
                                                                           placeholder="ZIP/Postal code"
                                                                           value="${ ProfileDetail.pincode}">
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <!--begin::Portlet-->
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
															<span class="m-portlet__head-icon"> <i
                                                                    class="flaticon-cogwheel-2"></i>
															</span>
                                                        <h3 class="m-portlet__head-text m--font-brand">Bank
                                                            Details</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div
                                                                class="form-group m-form__group row  m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                                                Bank Name:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       name="bankName" id="bankName"
                                                                       placeholder=" Bank Name"
                                                                       value="${ProfileDetail.bankName}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Bank
                                                                Ifsc:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       id="bankIFSC" name="bankIFSC"
                                                                       placeholder="Bank Ifsc"
                                                                       value="${ProfileDetail.bankIFSC}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">UPI:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       id="companyUpi" name="companyUpi"
                                                                       placeholder="UPI"
                                                                       value="${ProfileDetail.companyUpi}">
                                                            </div>
                                                        </div>


                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Branch
                                                                Name:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-8">
                                                                <input type="text" class="form-control m-input"
                                                                       name="bankBranch" id="bankBranch"
                                                                       placeholder="Bank Branch"
                                                                       value="${ProfileDetail.bankBranch}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Bank
                                                                Account No:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       name="bankAcno" id="bankAcno"
                                                                       placeholder="Bank Ac no "
                                                                       value="${ProfileDetail.bankAcno}">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end::Portlet-->
                                    </div>

                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <!--begin::Portlet-->
                                        <div class="m-portlet">
                                            <div class="m-portlet__head">
                                                <div class="m-portlet__head-caption">
                                                    <div class="m-portlet__head-title">
															<span class="m-portlet__head-icon"> <i
                                                                    class="flaticon-cogwheel-2"></i>
															</span>
                                                        <h3 class="m-portlet__head-text m--font-brand">
                                                            Other Details</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="m-portlet__body">
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6 col-sm-12">
                                                        <div
                                                                class="form-group m-form__group row  m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                                                User Name:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       name="userName" id="userName"
                                                                       placeholder=" User Name"
                                                                       value="${ProfileDetail.userName}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Customer Care
                                                                No:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       id="telephone" name="telephone"
                                                                       placeholder="Telephone"
                                                                       value="${ProfileDetail.telephone}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">GST
                                                                Registration Type:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <select class="form-control m-select2"
                                                                        id="gstRegistrationType"
                                                                        name="gstRegistrationType"
                                                                        placeholder="Select GST Type">
                                                                    <option value="UnRegistered"
                                                                            <c:if test="${ProfileDetail.gstRegistrationType=='UnRegistered'}">selected="selected"</c:if>>
                                                                        UnRegistered
                                                                    </option>
                                                                    <option value="Registered"
                                                                            <c:if test="${ProfileDetail.gstRegistrationType=='Registered'}">selected="selected"</c:if>>
                                                                        Registered
                                                                    </option>
                                                                    <option value="Composition Scheme"
                                                                            <c:if test="${ProfileDetail.gstRegistrationType=='Composition Scheme'}">selected="selected"</c:if>>
                                                                        Composition Scheme
                                                                    </option>
                                                                    <option value="Input Service Distributor"
                                                                            <c:if test="${ProfileDetail.gstRegistrationType=='Input Service Distributor'}">selected="selected"</c:if>>
                                                                        Input Service Distributor
                                                                    </option>
                                                                    <option value="E-Commerce Operator"
                                                                            <c:if test="${ProfileDetail.gstRegistrationType=='E-Commerce Operator'}">selected="selected"</c:if>>
                                                                        E-Commerce Operator
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">GSTIN:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       id="gst" name="gst" placeholder="GSTIN"
                                                                       value="${ProfileDetail.gst}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-6 col-md-6 col-sm-6 haveFssaiNo <c:if test="${ProfileDetail.haveFssaiNo==0}">m--hide</c:if>"></label>
                                                            <label
                                                                    class="col-form-label col-lg-6 col-md-6 col-sm-6 haveFssaiNo <c:if test="${ProfileDetail.haveFssaiNo==0}">m--hide</c:if>">FSSAI
                                                                NO.:</label>
                                                            <div class=" col-lg-6 col-md-6 col-sm-6">
                                                                <label
                                                                        class="m-checkbox m-checkbox--solid m-checkbox--brand ">
                                                                    <input type="checkbox" name="haveFssaiNo"
                                                                           id="haveFssaiNo"
                                                                           value="${ProfileDetail.haveFssaiNo}"
                                                                           <c:if test="${ProfileDetail.haveFssaiNo==1}">checked="checked"</c:if>>
                                                                    FSSAI NO. <span></span>
                                                                </label> <i data-toggle="m-tooltip" data-width="auto"
                                                                            class="m-form__heading-help-icon flaticon-info"
                                                                            title=""></i>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6 col-sm-6 haveFssaiNo <c:if test="${ProfileDetail.haveFssaiNo==0}">m--hide</c:if>">
                                                                <input type="text" class="form-control m-input"
                                                                       id="fssaiNo" name="fssaiNo"
                                                                       placeholder="FSSAI NO."
                                                                       value="${ProfileDetail.fssaiNo}">
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-12">

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Pan
                                                                No:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-8">
                                                                <input type="text" class="form-control m-input"
                                                                       name="panNo" id="panNo" placeholder="Pan No"
                                                                       value="${ProfileDetail.panNo}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Web
                                                                Site:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <input type="text" class="form-control m-input"
                                                                       name="website" id="website"
                                                                       placeholder="Web Site "
                                                                       value="${ProfileDetail.website}">
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Financial
                                                                Month Interval:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <select name="monthInterval" id="monthInterval"
                                                                        class="form-control m-select2"
                                                                        placeholder="Month Interval"
                                                                        data-allow-clear="true">
                                                                    <option value="">Month Interval</option>
                                                                    <c:forEach items="${MonthIntervalList}"
                                                                               var="MonthIntervalList">
                                                                        <option value="${MonthIntervalList.monthInterval}"
                                                                                <c:if test="${MonthIntervalList.monthInterval==ProfileDetail.monthInterval}">selected="selected"</c:if>>${MonthIntervalList.monthInterval}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div
                                                                class="form-group m-form__group row m--padding-left-0">
                                                            <label
                                                                    class="col-form-label col-lg-12 col-md-12 col-sm-12">Default
                                                                Financial year:</label>
                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                <select name="defaultYearInterval"
                                                                        id="defaultYearInterval"
                                                                        class="form-control m-select2"
                                                                        placeholder="Year Interval"
                                                                        data-allow-clear="true">
                                                                    <option value=""></option>
                                                                    <c:forEach items="${YearIntervalList}"
                                                                               var="YearIntervalList">
                                                                        <option value="${YearIntervalList.yearInterval}"
                                                                                <c:if test="${YearIntervalList.yearInterval==ProfileDetail.defaultYearInterval}">selected="selected"</c:if>>${YearIntervalList.yearInterval}</option>
                                                                    </c:forEach>
                                                                </select>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end::Portlet-->
                                    </div>

                                    <!--end::Portlet-->
                                </div>

                            </div>
                        </div>


                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div
                                    class="m-form__actions m-form__actions--solid m-form__actions--right">
                                <button type="submit" class="btn btn-brand" id="save_profile">
                                    Submit
                                </button>

                                <a href="/profile" id="canecl_profile"
                                   class="btn btn-secondary"> Cancel </a>
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
    <script
            src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js"
            type="text/javascript"></script>
    <script
            src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js"
            type="text/javascript"></script>
    <script
            src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>
    <%@include file="../global/global-script.jsp" %>
    <script
            src="<%=request.getContextPath()%>/script/jquery.form-repeater.js"
            type="text/javascript"></script>
    <!--end::Base Scripts -->

    <script
            src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js"
            type="text/javascript"></script>
    <script
            src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
            type="text/javascript"></script>

    <script
            src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/formValidation.min.js"
            type="text/javascript"></script>
    <script
            src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/framework/bootstrap.min.js"></script>
    <!-- Form Validation -->

    <%@include file="../global/location-ajax.jsp" %>

    <script>
        $(document).ready(function () {
            var i = parseInt($('#totalnumber').val());
            $("#addowner").click(function () {
                i = i + 1;
                $('#totalnumber').val(i)

            });
            $('#haveFssaiNo').click(function () {
                if ($(this).is(':checked')) {
                    $(this).val(1);
                    $(".haveFssaiNo").removeClass("m--hide");

                } else {
                    $(".haveFssaiNo").addClass("m--hide");
                    $(this).val(0);
                }
            });
            /* $("#closeowner").click(function() {
                i=i-1;
                $('#totalnumber').val(i)

            }); */
            var totalno = $('#totalnumber').val();
            $('.edit-example').repeater({
                    // options
                    animation: 'slide',
                    afterAdd: function (totalno) {
                        //i=i+1;
                        //totalno++;
                        //$('#totalnumber').val(i);
                        //console.log(i)
                    },
                    afterDelete: function () {
                        i = i - 1;
                        //totalno--;
                        $('#totalnumber').val(i);
                        //console.log(totalno)
                    }
                },
                [
                    // data
                    <c:set var="index" value="0"/>
                    <c:forEach var="ownerlist" items="${ownerlist}">
                    {
                        "ownernolist[${index}].id": "${ownerlist}",
                        "ownernolist[${index}]": "${ownerlist}"
                    },
                    <c:set var="index" value="${index+1}"/>
                    </c:forEach>
                ],
            );
            /* $('#customer-edit-form-submit').click(function() {
                var formdata = $('#customer-edit-form').serialize();
                console.log(JSON.stringify(formdata), null, 4);
                $.ajax({
                type : "POST",
                url : "/customer/create",
                data : formdata,
                success : function(response) {
                console.log(response);
            //window.location.href = "/customer"
                },
                })
            }); */

            getAllCountryAjax("countriesCode");
            $('#profile_edit')
                .formValidation(
                    {
                        framework: 'bootstrap',
                        live: 'disabled',
                        excluded: ":disabled",
                        button: {
                            selector: "#save_profile",
                            disabled: "disabled",
                        },
                        icon: null,
                        fields: {
                            name: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Name is Required'
                                    }

                                }
                            },
                            mobileNo: {
                                validators: {
                                    stringLength: {
                                        max: 10,
                                        message: 'The mobile no. must be 10 digit long'
                                    },
                                    regexp: {
                                        regexp: /^[0-9+]+$/,
                                        message: 'The mobile no. can only consist of number'
                                    }
                                }
                            },
                            fssaiNo: {
                                validators: {
                                    stringLength: {
                                        max: 14,
                                        min: 14,
                                        message: 'The FSSAI NO. must be 14 digit long'
                                    }
                                }
                            },
                            /* companyUpi : {
                                validators : {
                                    regexp : {
                                        regexp : /^\w+@\w+$/,
                                        message : 'Invalid UPI'
                                    }
                                }
                            }, */
                            email: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Emailis Required'
                                    }

                                }
                            },
                            userName: {
                                validators: {
                                    notEmpty: {
                                        message: 'The User Name Is reqired'
                                    },
                                }
                            },
                            contactName: {
                                validators: {
                                    notEmpty: {
                                        message: 'The contact Name Is reqired'
                                    },
                                }
                            },
                            defaultYearInterval: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Year Interval Is reqired'
                                    },
                                }
                            },
                            monthInterval: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Month Interval Is reqired'
                                    },
                                }
                            },
                            gstRegistrationType: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Gst Type Is reqired'
                                    },
                                }
                            },
                            password: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Password Is reqired'
                                    },
                                }
                            },
                            countriesCode: {
                                validators: {
                                    notEmpty: {
                                        message: 'The Country Is reqired'
                                    },
                                }
                            },
                            stateCode: {
                                validators: {
                                    notEmpty: {
                                        message: 'The State Is reqired'
                                    },
                                }
                            },
                            cityCode: {
                                validators: {
                                    notEmpty: {
                                        message: 'The City Is reqired'
                                    },
                                }
                            },
                            userName: {
                                validators: {
                                    notEmpty: {
                                        message: 'The User Name Is reqired'
                                    },
                                }
                            },
                            pinCode: {
                                validators: {
                                    regexp: {
                                        regexp: /^\d{6}$/,
                                        message: 'The ZIP/Postal code can only consist of number and six digit'
                                    }
                                }
                            },
                            bankName: {
                                validators: {
                                    stringLength: {
                                        max: 50,
                                        message: 'The bank name must be less than 50 characters long'
                                    },
                                    regexp: {
                                        regexp: /^[a-zA-Z0-9_-\s-., ]+$/,
                                        message: 'The bank name can only consist of alphabetical, number and underscore'
                                    }
                                }
                            },
                            bankBranch: {
                                validators: {
                                    stringLength: {
                                        max: 50,
                                        message: 'The branch name must be less than 50 characters long'
                                    },
                                    regexp: {
                                        regexp: /^[a-zA-Z0-9_-\s-., ]+$/,
                                        message: 'The branch name can only consist of alphabetical, number and underscore'
                                    }
                                }
                            },
                            accountHolderName: {
                                validators: {
                                    stringLength: {
                                        max: 50,
                                        message: 'The account holder name name must be less than 50 characters long'
                                    },
                                    regexp: {
                                        regexp: /^[a-zA-Z0-9_-\s-., ]+$/,
                                        message: 'The account holder name name can only consist of alphabetical, number and underscore'
                                    }
                                }
                            },
                            bankAcno: {
                                validators: {
                                    stringLength: {
                                        max: 20,
                                        message: 'The bank aacount no must be 20 digit long'
                                    },
                                    regexp: {
                                        regexp: /^[0-9+]+$/,
                                        message: 'The bank aacount no can only consist of number'
                                    }
                                }
                            },
                            bankIFSC: {
                                validators: {
                                    stringLength: {
                                        max: 50,
                                        message: 'The ifsc code must be less than 50 characters long'
                                    }
                                    //,
                                    //	regexp : {
                                    //		regexp : /[a-zA-Z0-9]$/,
                                    ///		message : 'The ifsc code can only consist of alphabetical and number'
                                    //	}
                                }
                            },
                            swiftCode: {
                                validators: {
                                    stringLength: {
                                        max: 50,
                                        message: 'The swift code must be less than 50 characters long'
                                    },
                                    regexp: {
                                        regexp: /[a-zA-Z0-9]$/,
                                        message: 'The swift code can only consist of alphabetical and number'
                                    }
                                }
                            },

                        }
                    });
            //$("#countriesCode").select2();
            //	$("#stateCode").select2();
            //	$("#cityCode").select2();
            //	$("#gstRegistrationType").select2();
            //$("#financialMonth").select2();
            //$("#defaultYearInterval").select2();
        });
        if ($("#gstRegistrationType").val() == "UnRegistered") {
            $("#gst").prop('disabled', true);
            //$("#verifyGSTINButton").prop('disabled', true);
            //$('#contact_form').formValidation('enableFieldValidators', 'gstin', false);
        } else {
            $("#gst").prop('disabled', false);
            //$("#verifyGSTINButton").prop('disabled', false);
            //$('#contact_form').formValidation('enableFieldValidators', 'gstin', true);
        }
        $("#gstRegistrationType").change(function () {

            if ($("#gstRegistrationType").val() == "UnRegistered") {
                $("#gst").val("");
                $("#gst").prop('disabled', true);
            } else {

                $("#gst").prop('disabled', false);

            }
        });
    </script>

    </body>
    <!-- end::Body -->
</c:forEach>
</html>