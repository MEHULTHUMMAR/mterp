<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <%@include file="../header/head.jsp" %>
        <title>Edit Customer | ${ContactDetails.contactId}</title>
        <style type="text/css">
        	input#gstin:disabled:hover{cursor:not-allowed;}
	   		.badge{border-top-left-radius: 15px;border-bottom-left-radius: 15px;width: 100%;padding:6px 10px;}
	       	.date:before{top:6px;right:6px;}
	        .search-font {top: 7px;}
	    	select#datatableCustomTableLengthSelectBox {width: auto;float: right;}
	    	.select2-selection.select2-selection--single{height:calc(2.2125rem + 2px) !important;}
	    	.select2-selection__rendered{font-size:.875rem;padding: 5px !important;line-height:1.6 !important;}
	    	.select2-container--default .select2-selection--single .select2-selection__arrow{top:14px;}
	    	.bootstrap-tagsinput input[type="text"]{margin:0px;}
	    	span.tag.label-info{padding:2px 5px;}
	    	.paction a{height:20px !important;width:20px !important;}
		     @media only screen and (max-width:767px){
		    	.m-subheader a.m-portlet__nav-link.btn.btn-outline-info.m-btn.m-btn--icon.m-btn--icon-only.m-btn--custom.m-btn--pill.m-btn--air{display:none;}
		    	button#clear_contact, a#save_and_print_contact, button#save_and_create_new_contact{display:none;}
		    	.m-body .m-content{padding-bottom:70px;}
		    }
	    </style>
        <link href="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/formValidation.min.css" type="text/css"/>
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
                            <h3 class="m-subheader__title m-subheader__title--separator">Edit Customer
                                | ${ContactDetails.contactId}</h3>
                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home">
                                    <a href="/" class="m-nav__link m-nav__link--icon">
                                        <i class="m-nav__link-icon la la-home"></i>
                                    </a>
                                </li>
                                <li class="m-nav__separator">-</li>
                                <li class="m-nav__item">
                                    <a href="/contact/" class="m-nav__link">
                                        <span class="m-nav__link-text">Customer</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <a href="javascript:void(0)" onclick="lastUrl()"
                           class="m-portlet__nav-link btn btn-outline-info m-btn m-btn--icon m-btn--icon-only m-btn--custom m-btn--pill m-btn--air"
                           title="Go Back" style="float: right;width: 20px;height: 20px;top: 0px;">
                            <i class="fa  fa-arrow-left fa-lg"></i>
                        </a>
                    </div>
                </div>

                <div class="m-content">
                    <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="contact_form"
                          action="/contact/savecontact" method="post">
                        <input type="hidden" name="deleteAddress" id="deleted-address" value=""/>
                        <input type="hidden" name="contactId" value="${ContactDetails.contactId}"/>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                        <div class="m-portlet mb-0">
                                            <div class="m-portlet__body card-body-sm">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="row">

                                                            <div class="col-md-4">
                                                                <div class="form-group row ">
                                                                    <label class="col-lg-12 col-md-12 col-sm-12">Company Name</label>
                                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                                        <input type="text" class="form-control form-control-sm"
                                                                               name="companyName" id="companyName"
                                                                               placeholder="Company Name" value="${ContactDetails.companyName}">
                                                                    </div>
                                                                    

                                                                </div>
                                                            </div>

                                                                    <div class="col-md-3">
                                                                        <div class="form-group row">
                                                                            <label class="col-lg-12 col-md-12 col-sm-12">Email</label>
                                                                            <div class="col-lg-12 col-md-12 col-sm-12">
                                                                                <input type="text"
                                                                                       class="form-control form-control-sm"
                                                                                       name="email" placeholder="Email"
                                                                                       value="${ContactDetails.email}">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="row">
                                                                	<div class="col-md-12">
                                                                		<div id="address_repeater">
			                                                                <div data-repeater-list>
			                                                                    <c:forEach items="${ContactDetails.contactAddressVos}" var="contactAddress" varStatus="status">
			                                                                    <c:if test="${contactAddress.isDeleted == 0}">
		                                                                        <div data-repeater-item>
		                                                                        	 <div class="row" style="border: 1px solid; margin-top: 30px;">
			                                                                            <input type="hidden"
			                                                                                   name="contactAddressVos[{index}].contactAddressId"
			                                                                                   id="contactAddressId{index}"
			                                                                                   value="${contactAddress.contactAddressId}"/>
			                                                                            <input type="hidden"
			                                                                                   name="contactAddressVos[{index}].isDefault"
			                                                                                   id="defaultAddress{index}"
			                                                                                   value="${contactAddress.isDefault}"/>
			                                                                                   <div class="col-lg-3 col-md-3 col-sm-12">
																				<div class="form-group row">
																					<label class="col-lg-12 col-md-12 col-sm-12">Contact Name</label>
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<input type="text"
																							   class="form-control form-control-sm"
																							   name="contactAddressVos[{index}].contactName"
																							   placeholder="Contact Name"
																							   value="${contactAddress.contactName}">
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
																							   value="${contactAddress.mobNo}">
																					</div>
																				</div>
																			</div>
			                                                                            <div class="col-lg-5 col-md-5 col-sm-12">
				                                                                            <div class="form-group row">
				                                                                                <label class="col-lg-12 col-md-12 col-sm-12">Address</label>
				                                                                                <div class="col-lg-12 col-md-12 col-sm-12">
				                                                                                    <input type="text"
				                                                                                           class="form-control form-control-sm"
				                                                                                           name="contactAddressVos[{index}].address"
				                                                                                           placeholder="Address"
				                                                                                           value="${contactAddress.address}">
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
			                                                                                            data-default="${contactAddress.countriesCode}"
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
			                                                                                            data-default="${contactAddress.stateCode}"
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
			                                                                                            data-default="${contactAddress.cityCode}"
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
			                                                                                           value="${contactAddress.pinCode}">
			                                                                                </div>
			                                                                                </div>
			                                                                                </div>
		                                                                            </div>	
		                                                                        </div>
		                                                                        </c:if>
			                                                                    </c:forEach>
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
                    </form>
                </div>
            </div>
        </div>
        <!-- end:: Body -->
        <div class="smt-spinner-circle" id="loader" style="display:none">
            <div class="smt-spinner"></div>
            <div class="smt-spinner-inner-circle"></div>
        </div>

        <footer class="m-grid__item		m-footer "
                style="min-height: 50px;height: 50px;position: fixed; bottom: 0; right: 0; left: 0; background-color:#282733;">
            <div class="m-container m-container--fluid m-container--full-height m-page__container"
                 style="display : flex;">
                <div style="justify-content: flex-start;flex: 1 1 0;display: flex;white-space: nowrap;">
                    <a href="/contact/${type}/${ContactDetails.contactId}" id="cancel_contact" class="btn btn-danger">
                        Cancel
                    </a>
                    &nbsp;
                </div>
                 <div style="justify-content: flex-end;flex: 1 1 0;display: flex;white-space: nowrap;">
                    <button type="button" class="btn btn-info" id="save_contact">
                        Save
                    </button>
                </div>
            </div>
        </footer>


    </div>
    <!-- end:: Page -->

    <!--begin::Base Scripts -->
    <script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js?v=0.0.1"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js?v=0.0.1"></script>
    <%@include file="../global/global-script.jsp" %>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js?v=0.0.1"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js?v=0.0.1"></script>
    <script src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/formValidation.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/framework/bootstrap.min.js?v=0.0.1"></script>
    <%@include file="../global/location-ajax.jsp" %>
    <script src="<%=request.getContextPath() %>/script/contact/contact-script.js?v=0.0.40"></script>
    <script>
    var  pinCodeValidator = {
            validators: {
    			stringLength: {
    				max: 50,
    				message: 'The ZIP/Postal code can only consist of Fifty digit'
    			},

            }
        };
        $(document).ready(function () {

        });


    </script>
    </body>
</html>