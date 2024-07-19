<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header/head.jsp" %>
    <title>New Customer</title>
	<style type="text/css">
	   		.badge{border-top-left-radius: 15px;border-bottom-left-radius: 15px;width: 100%;padding:6px 10px;}
	    	.bootstrap-tagsinput input[type="text"]{margin:0px;}
	    	span.tag.label-info{padding:2px 5px;}
	    	.paction a{height:20px !important;width:20px !important;}

	    </style>
</head>

<body data-submit="#save_contact" data-cancel="#cancel_contact" class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<div class="m-grid m-grid--hor m-grid--root m-page">
    <%@include file="../header/header.jsp" %>
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
        <%@include file="../header/navigation.jsp" %>
        <div class="m-grid__item m-grid__item--fluid m-wrapper">
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">New Customer</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="/" class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>
                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item">
                                <a href="/contact" class="m-nav__link">
                                    <span class="m-nav__link-text">Customer</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left " id="contact_form" action="/contact/savecontact" method="post" >
                    <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="m-portlet mb-0">
                                        <div class="m-portlet__body card-body-sm">
                                            <div class="row">
                                            	<div class="col-lg-12 col-md-12 col-sm-12">
                                            		<div class="row">

                                            			<div class="col-lg-4 col-md-4 col-sm-12">
                                            				<div class="row">
                                                                <label class="col-lg-12 col-md-12 col-sm-12">Company Name</label>
                                                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
	                                                                    <input type="text" class="form-control  form-control-sm"
	                                                                           id="companyName" name="companyName" 
	                                                                           placeholder="Company Name" autofocus value=""
	                                                                            >
	                                                                </div>

                                                                  
                                                                                                                              
                                                            </div>                                                            
                                            			</div>



                                            			<div class="col-lg-3 col-md-3 col-sm-12">
                                            				<div class="form-group row">
                                                                <label class="col-lg-12 col-md-12 col-sm-12">Email</label>
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <input type="text"
                                                                           class="form-control  form-control-sm"
                                                                           name="email" placeholder="Email"
                                                                           value="">
                                                                </div>
                                                            </div>
                                            			</div>




                                            		</div>

                                            		<div class="row">
                                            			<div class="col-md-12">
	                                            			<div id="address_repeater">
	                                                            <div data-repeater-list>
	                                                                <div data-repeater-item>
	                                                                    <div class="row" style="border: 1px solid; margin-top: 30px;">
																			<div class="col-lg-3 col-md-3 col-sm-12">
																				<div class="form-group row">
																					<label class="col-lg-12 col-md-12 col-sm-12">Contact Name</label>
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<input type="text"
																							   class="form-control form-control-sm"
																							   name="contactAddressVos[{index}].contactName"
																							   placeholder="Contact Name"
																							   value="">
																					</div>
																				</div>
																			</div>
																			<div class="col-lg-3 col-md-3 col-sm-12">
																				<div class="form-group row">
																					<label class="col-lg-12 col-md-12 col-sm-12">Mobile No</label>
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<input type="text"
																							   class="form-control form-control-sm"
																							   name="contactAddressVos[{index}].mobNo"
																							   placeholder="Mobile No"
																							   value="">
																					</div>
																				</div>
																			</div>
																			<div class="col-lg-5 col-md-5 col-sm-12">
			                                                                    <div class="form-group row">
			                                                                        <label class="col-lg-12 col-md-12 col-sm-12">Address </label>
			                                                                        <div class="col-lg-12 col-md-12 col-sm-12">
			                                                                            <input type="text"
			                                                                                   class="form-control form-control-sm" 
			                                                                                   name="contactAddressVos[{index}].address"
			                                                                                   placeholder="Address"
			                                                                                   value="">
			                                                                        </div>
			                                                                    </div>
			                                                                </div>

			                                                                <div class="col-lg-1 col-md-1 col-sm-12">
			                                                                	<div class="form-group row">
			                                                                		<label>&nbsp;</label>
			                                                                		<div class="col-lg-12 col-md-12 col-sm-12 text-right">
					                                                                	<a href="#" data-repeater-delete="" data-toggle="modal"
					                                                                       class="btn btn-sm btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--custom m-btn--pill m-btn--air"
					                                                                       style="width: 20px;height: 20px;top: 7px;">
					                                                                        <i class="la la-close"></i>
					                                                                    </a>
					                                                                </div>
				                                                                </div>
			                                                                </div>
			                                                                <div class="col-md-12">
			                                                                    <div class="form-group row">
			                                                                        <div class="col-md-3">
			                                                                            <label>Select Country<span style="font-size:1.25rem;" class="text-danger">*</span></label>
			                                                                            <select class="form-control m-select2 "
			                                                                                    id="countriesCode{index}"
			                                                                                    data-default="${sessionScope.countryCode}"
			                                                                                    name="contactAddressVos[{index}].countriesCode"
			                                                                                    onchange="getAllStateAjax('countriesCode{index}','stateCode{index}')"
			                                                                                    placeholder="Select Country"
			                                                                                    data-allow-clear="true">
			                                                                            </select>
			                                                                        </div>
			                                                                        <div class="col-md-3">
			                                                                            <label>Select State<span style="font-size:1.25rem;" class="text-danger">*</span></label>
			                                                                            <select class="form-control m-select2"
			                                                                                    id="stateCode{index}"
			                                                                                    data-default="${sessionScope.stateCode}"
			                                                                                    name="contactAddressVos[{index}].stateCode"
			                                                                                    onchange="getAllCityAjax('stateCode{index}','cityCode{index}')"
			                                                                                    data-allow-clear="false"
			                                                                                    placeholder="Select State">
			                                                                            </select>
			                                                                        </div>
			                                                                        <div class="col-md-3">
			                                                                            <label>Select City<span style="font-size:1.25rem;" class="text-danger">*</span></label>
			                                                                            <select class="form-control m-select2"
			                                                                                    id="cityCode{index}"
			                                                                                    data-default="${sessionScope.cityCode}"
			                                                                                    name="contactAddressVos[{index}].cityCode"
			                                                                                    placeholder="Select City"
			                                                                                    data-allow-clear="true">
			                                                                            </select>
			                                                                        </div>
			                                                                        <div class="col-md-3">
			                                                                            <label>Pincode</label>
			                                                                            <input type="text"
			                                                                                   class="form-control form-control-sm"
			                                                                                   name="contactAddressVos[{index}].pinCode"
			                                                                                   placeholder="ZIP/Postal code"
			                                                                                   value="">
			                                                                        </div>
			                                                                    </div>
			                                                                </div>
			                                                            </div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="form-group">
	                                                                <div class="m-demo-icon">
	                                                                    <div class="m-demo-icon__class">
	                                                                        <a href="#" data-toggle="modal"
	                                                                           data-toggel="modal" data-repeater-create=""
	                                                                           class="m-link m--font-boldest text-center"><i class="flaticon-plus m--font-primary"></i> Add More Address</a>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
                                            		</div>


                                            	</div>
                                            </div>
                                        </div>
                                    </div>                                                
                                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <footer class="m-grid__item	m-footer" style="min-height: 50px;height: 50px;position: fixed; bottom: 0; right: 0; left: 0; background-color:#282733;">
        <div class="m-container m-container--fluid m-container--full-height m-page__container" style="display : flex;">
            <div style="justify-content: flex-start;flex: 1 1 0;display: flex;white-space: nowrap;">
                <a href="/contact" id="cancel_contact" class="btn btn-danger mr-1">Cancel</a>
            </div>
            <div style="justify-content: flex-end;flex: 1 1 0;display: flex;white-space: nowrap;">
                <button type="button" class="btn btn-info mr-1" id="save_contact">Save</button>
            </div>
        </div>
    </footer>
</div>

<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<%@include file="../global/location-ajax.jsp" %>

<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script src="<%=request.getContextPath() %>/script/contact/contact-script.js?v=0.0.39"></script>
<script>

    $(document).ready(function () {

    });

</script>
</body>
</html>