<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>Dashboard</title>
    <style type="text/css">
    	@media (min-width: 992px){
			.modal-lg, .modal-xl {max-width: 990px !important;}
		}
		.select2-container--default .select2-selection--single .select2-selection__arrow b, .select2-container--default .select2-selection--multiple .select2-selection__arrow b, .select2-container--default .select2-selection--single .select2-selection__arrow:after, .select2-container--default .select2-selection--multiple .select2-selection__arrow:after{display:none !important;}
		span.select2.select2-container.select2-container--default{width:100% !important;}
		.select2{box-shadow:none !important;}
		.modal.fade.show{padding-right:0px !important;}
		.btn-vasy{background-color:#00a4e5 !important;color:#fff !important;}
		body.modal-open .m-grid.m-grid--hor.m-grid--root.m-page{-webkit-filter: blur(2px);-moz-filter: blur(2px);-o-filter: blur(2px);-ms-filter: blur(2px);filter: blur(2px);}
        .select2-container {display: block;}
        .m-widget24 .m-widget24__item .m-widget24__stats {margin-top: 0px !important;}
        .wizard.wizard-3 .wizard-nav .wizard-steps .wizard-step[data-wizard-state="current"] .wizard-label{color:#000;padding-bottom:0px;}
        .wizard.wizard-3 .wizard-nav .wizard-steps .wizard-step .wizard-label{padding-bottom:0px !important;}
        .wizard.wizard-3 .wizard-nav .wizard-steps .wizard-step[data-wizard-state="current"] .wizard-label .wizard-bar:after{background-color:#000;}
        .receipt-sample{width:100%;border-width:3px;border:3px solid #000;border-top-style:dotted;border-bottom-style:dotted;padding:15px;}
        .card.card-custom{border:2px solid #ccc;}
        .wizard-steps.px-8.py-8.px-lg-8.py-lg-3{background-color:#f7f7f7;margin-bottom:10px;border-bottom:2px solid #ccc;}
        .wizard-nav p.px-8.px-lg-8{border-bottom:2px solid #ccc;padding-bottom:7px;}
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {-webkit-appearance: none;margin: 0;}
        input[type=number] {-moz-appearance: textfield;}
        td.grey-bg{background-color:#ccc;}
        .invoice-sample{width:100%;}
        .invoice-sample tr td:first-child{width:30%;}
        .invoice-sample tr td:nth-child(2){width:43%;background-color:#fff !important;}
        .invoice-sample tr td:nth-child(3){width:10%;margin-right:2%;}
        .invoice-sample tr td:nth-child(4){width:15%;}
        .invoice-sample tr{margin-bottom:5px;display:flex;}
        .invoice-sample tr td{border-radius:5px;line-height:12px;}
        div#vatbox, div#otherbank, div#upiid, div#machineid{display:none;}
        .btn-dark{background-color:#000 !important;}
        .client-logo{height:120px;}
        .bank-list{margin-bottom:20px;border-bottom:1px solid #ccc;}
        .btn-copy{margin-bottom:15px;}
        .alert.alert-primary {
		    background-color: #00a4e5 !important;
		    border-color: #00a4e5 !important;
		    color: #FFFFFF;
		}
		div#m_header_topbar a.m-portlet__nav-link.m-dropdown__toggle.dropdown-toggle.btn.btn--sm.m-btn--pill.m-btn.btn-outline-light.m-btn--hover-light{background-color:#fff !important;}
		div#m_header_topbar .btn.btn-outline-light.dropdown-toggle:after{color:#3F4254 !important;content: "\f0d7" !important;font: normal normal normal 14px/1 FontAwesome !important;}
		.blink_me {
  animation: blinker 1s linear infinite;
}

@keyframes blinker {
  50% {
    opacity: 0;
  }
}
.pulse-button {

			position: relative;

			border: none;
			box-shadow: 0 0 0 0 rgba(232, 76, 61, 0.7);
			background-color: #e84c3d;
			background-size:cover;
			background-repeat: no-repeat;
			cursor: pointer;
			-webkit-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
			-moz-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
			-ms-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
			animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
			}
			.pulse-button:hover 
			{
			-webkit-animation: none;-moz-animation: none;-ms-animation: none;animation: none;
			}

			@-webkit-keyframes pulse {to {box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);}}
			@-moz-keyframes pulse {to {box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);}}
			@-ms-keyframes pulse {to {box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);}}
			@keyframes pulse {to {box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);}
		}

    </style>
    <link href="<%=request.getContextPath()%>/dashboard/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/dashboard/fonts/fontawesome/assets/Pe-icon-7-stroke.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <link href="/css/wizard-3.css" rel="stylesheet" type="text/css" />
    <!-- <link href="/css/plugins.bundle.css" rel="stylesheet" type="text/css" /> -->
    <link href="/css/prismjs.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/css/style.bundle.css" rel="stylesheet" type="text/css"/>
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
                    <div class="mr-auto ">
                        
                        
                     
                    	 <%--  <c:if test="${companyId != 560}">
      					  <span class="panel" style="white-space: $whitespace;font-family:monospace;font-size:1em">
						    <span class="panelContent">
                                <spring:eval expression="@environment.getProperty('base.domain')" var="domain" />
						    	Manage Social Distancing at your store & Get Orders online. Share your store Link - <a
                                    href="http://app.${domain}/ogoshops/${sessionScope.userId}/new">'http://app.${domain}/ogoshops/${sessionScope.userId}/new'</a>
						    </span>
						    	<button class="copy-text-button fa fa-clipboard"
                                        data-clipboard-text="http://app.${domain}/ogoshops/${sessionScope.companyId}/new"
                                        title="click to copy"></button>
						    	<span class="panelContent"> 
						    	with your customers.
						    	</span>
						    
						    
						</span>
      					  </c:if> --%>
                    	 

                    </div>
                    
                   
                </div>
            </div>
            <!-- END: Subheader -->
            <!-- START: New DashBoard -->
            <div class="m-content">
                <div class="app-main__outer">
                    <div class="app-main__inner">
                        <div id="top-board" class="card no-shadow bg-transparent no-border rm-borders mb-3">
                            <div class="card no-shadow" style="background-color:transparent;">
                                <div class="row">
                                    <div class="col-md-12 col-lg-3">
                                       <%-- <ul class="list-group list-group-flush">
                                            <li class="list-group-item mb-3" style="background-color:#fff;">
                                                <div class="widget-content p-0">
                                                    <div class="widget-content-outer">
                                                        <div class="widget-content-wrapper mb-2">
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">Access key</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                                 ${sessionScope.accessKey}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </li>
                                            
                                        </ul>--%>
                                    </div>
                                    <div class="col-md-12 col-lg-3">
                                       <%-- <ul class="list-group list-group-flush">
                                            <li class="list-group-item mb-3" style="background-color:#fff;">
                                                <div class="widget-content p-0">
                                                    <div class="widget-content-outer">
                                                        <div class="widget-content-wrapper mb-2">
                                                            <div class="widget-content-left">
                                                                <div class="widget-heading">Secret Key</div>
                                                            </div>
                                                            <div class="widget-content-right">
                                                               ${sessionScope.secretKey}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                             </li>
                                            
                                        </ul>--%>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- END: New Dashboard -->
            

        </div>

    </div>
    <!-- end:: Body -->

    <!-- Include Footer -->
    <%@include file="../footer/footer.jsp" %>
    
    

</div>
<!-- end:: Page -->

<div class="modal fade" id="formfirsttime" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
            	<div class="d-flex flex-column flex-root">
        <div class="d-flex flex-row flex-column-fluid page">
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="d-flex flex-column-fluid">
                        <div class="">
                            <div class="card card-custom">
                                <div class="card-body p-0">
                                    <div class="wizard wizard-3" id="kt_wizard_v3" data-wizard-state="step-first" data-wizard-clickable="true">
                                        <div class="wizard-nav">
                                            <div class="col-12">
                                                <div class="row">
                                                    <div class="wizard-steps col-8 px-8 py-8 px-lg-8 py-lg-3" style="padding-top:0px !important;">
                                                        <div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
                                                            <div class="wizard-label">
                                                                <h3 class="wizard-title">
                                                                    <span>1.</span> Profile Setup
                                                                </h3>
                                                                <div class="wizard-bar"></div>
                                                            </div>
                                                        </div>
                                                        <div class="wizard-step" data-wizard-type="step">
                                                            <div class="wizard-label">
                                                                <h3 class="wizard-title">
                                                                    <span>2.</span> Accounting
                                                                </h3>
                                                                <div class="wizard-bar"></div>
                                                            </div>
                                                        </div>
                                                        <div class="wizard-step" data-wizard-type="step">
                                                            <div class="wizard-label">
                                                                <h3 class="wizard-title">
                                                                    <span>3.</span> Bank Details
                                                                </h3>
                                                                <div class="wizard-bar"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="wizard-steps col-4 px-8 py-8 px-lg-8 py-lg-3">
                                                    </div>
                                                    <h4 class="px-8 col-12 px-lg-8">Let's setup your Business</h4>
                                                    <p class="px-8 px-lg-8 col-12">Your Location name and address will be visible on your receipts and register. You can change this information later.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="justify-content-center py-8 px-8 py-lg-8 px-lg-8">
                                            <div class="row">
                                                <div class="col-xl-8">
                                                    <form class="form" id="kt_form">
                                                        <div data-wizard-type="step-content" data-wizard-state="current">
                                                            <div class="row">
                                                                <div class="col-xl-4">
                                                                    <div class="form-group">
                                                                        <label>Logo</label>
                                                                        <input type='file' class="form-control" id="imgInp" />
                                                                        <span class="form-text text-muted">Recommended : PNG format, Dimention : 120px*120px</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-8">
                                                                    <div class="form-group">
                                                                        <label>Legal Business Name*</label>
                                                                        <input id="businessname" type="text" class="form-control" name="businessname"  value="${CompanyVo.name}"  />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label>Brand/Store Name*</label>
                                                                        <input id="brandname" type="text" class="form-control" name="brandname"   value="${CompanyVo.name}" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label>Industry*</label>
                                                                        <select id="industry" name="industry" class="form-control m-select2" data-default="${CompanyVo.industrytype.id}">
                                                                            <option value="">Select</option>
                                                                           
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label>Company Email*</label>
                                                                        <input id="companyemail" type="email" class="form-control" name="companyemail" value="${CompanyVo.email}" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label>Customer Facing Email*</label>
                                                                        <input id="customerfacingemail" type="email" class="form-control" name="customerfacingemail" value="${CompanyVo.email}" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>Owner Phone*</label>
                                                                        <input id="ownerphone" type="number" class="form-control mb-5" name="ownerphone" value="${CompanyVo.contactNo}" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>Company Phone*</label>
                                                                        <input id="phone" type="number" class="form-control mb-5" name="phone" value="${CompanyVo.contactNo}" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label>Website</label>
                                                                        <input id="website" type="text" class="form-control" name="website" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Address 1</label>
                                                                <input id="address1" type="text" class="form-control" name="address1" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Address 2</label>
                                                                <input id="address2" type="text" class="form-control" name="address2" />
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>Country*</label>
                                                                         <select class="form-control m-select2 "
                                                                                    id="countriesCode1"
                                                                                    data-default="${sessionScope.countryCode}"
                                                                                    name="countriesCode"
                                                                                    onchange="getAllStateAjax('countriesCode1','stateCode1')"
                                                                                    placeholder="Select Country"
                                                                                    data-allow-clear="false">
                                                                            </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>State*</label>
                                                                        <select class="form-control m-select2"
                                                                                    id="stateCode1"
                                                                                    name="stateCode"
                                                                                    onchange="getAllCityAjax('stateCode1','cityCode1')"
                                                                                    data-allow-clear="false"
                                                                                    placeholder="Select State">
                                                                            </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>City*</label>
                                                                        <select class="form-control m-select2"
                                                                                    id="cityCode1"
                                                                                    data-default="${sessionScope.cityCode}"
                                                                                    name="cityCode"
                                                                                    placeholder="Select City"
                                                                                    data-allow-clear="false">
                                                                            </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xl-3">
                                                                    <div class="form-group">
                                                                        <label>Postcode</label>
                                                                        <input id="pincode" type="text" class="form-control" name="pincode"  />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="pb-5" data-wizard-type="step-content">
                                                            <div class="form-group">
                                                                <label>Tax Type*</label><br>
                                                                <input type="radio" id="gst" name="taxtype" value="${Constant.GST}" checked>
                                                                <label for="gst">GST</label> &nbsp; &nbsp;
                                                                <input type="radio" id="vat" name="taxtype" value="${Constant.VAT}">
                                                                <label for="vat">VAT</label> &nbsp; &nbsp;
                                                                <input type="radio" id="unregistered" name="taxtype" value="unregistered">
                                                                <label for="unregistered">Unregistered</label>
                                                            </div>
                                                            <div id="vatbox">
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>VAT Id</label>
                                                                            <input type="text" class="form-control" name="vatid" id="vatid" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Default Tax (%)</label>
                                                                            <input type="number" class="form-control" name="vatdefaultgsttax" id="vatdefaultgsttax" maxlength="2" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="gstbox">
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>GST Type*</label>
                                                                            <select id="gsttype" name="gsttype" class="form-control">
                                                                                <option value="">Select</option>
                                                                                <option value="UnRegistered" >UnRegistered</option>
		                                                                        <option value="Registered" selected>Registered Regular</option>
		                                                                        <option value="Composition Scheme">Registered Composition </option>
		                                                                        <option value="Input Service Distributor">Input Service Distributor </option>
		                                                                        <option value="E-Commerce Operator">E-Commerce Operator</option>
		                                                                        <option value="Consumer">Consumer</option>
		                                                                        <option value="Overseas">Overseas</option>
		                                                                        <option value="SEZ">SEZ</option>
		                                                                        <option value="Demand Export">Demand Export</option>
		                                                                        <option value="UIN Holders">UIN Holders</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>GSTIN*</label>
                                                                            <input type="text" class="form-control" name="gstin" id="gstinno" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Default Tax</label>
                                                                            <select id="defaultgsttax" name="defaultgsttax" class="form-control">
                                                                                <option value="">Select</option>
                                                                               <c:forEach items="${taxlist}" var="taxlist">
			                                                                        <option value="${taxlist.taxId}" data-rate="${taxlist.taxRate}">
			                                                                                ${taxlist.taxName}(${taxlist.taxRate}%)
			                                                                        </option>
			                                                                    </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Purchase Tax Type</label>
                                                                            <select id="purchasetaxtype" name="purchasetaxtype" class="form-control">
                                                                                <option value="Inclusive of Taxes" >Inclusive of Taxes</option>
                                                                                <option value="Exclusive of Taxes" selected="">Exclusive of Taxes</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Sales Tax Type</label>
                                                                            <select id="salestaxtype" name="salestaxtype" class="form-control">
                                                                                <option value="Exclusive of Taxes" >Exclusive of Taxes</option>
                                                                                <option value="Inclusive of Taxes" selected="">Inclusive of Taxes</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Return Filling</label>
                                                                            <select id="returnfilling" name="returnfilling" class="form-control">
                                                                                <option value="Monthly" selected="">Monthly</option>
                                                                                <option value="Quarterly">Quarterly</option>
                                                                                <option value="Annual">Aannual</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xl-6">
                                                                    <div class="form-group">
                                                                        <label> Month Interval</label>
                                                                        <select id="fmfinancialyear" name="fmfinancialyear" class="form-control">
                                                                            <c:forEach items="${MonthIntervalList}"
                                                                               var="MonthIntervalList">
		                                                                        <option value="${MonthIntervalList.monthInterval}"
		                                                                                <c:if test="${MonthIntervalList.monthInterval==CompanyVo.monthInterval}">selected="selected"</c:if> >${MonthIntervalList.monthInterval}</option>
		                                                                    </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="pb-5" data-wizard-type="step-content">
                                                            <div class="bank-list">
                                                                <div class="row">
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Select Bank</label>
                                                                            <select id="selectbank" name="selectbank" class="form-control m-select2">
                                                                                <option value="">Select</option>
                                                                                <c:forEach items="${BankList}" var="BankList">
			                                                                        <option value="${BankList.bankMasterId}" >${BankList.bankName}</option>
			                                                                    </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div id="otherbank" class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Bank Name</label>
                                                                            <input type="text" class="form-control" name="otherbankname" id="otherbankname" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Account Holder Name</label>
                                                                            <input type="text" class="form-control" name="accountname" id="accountname" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Account Number</label>
                                                                            <input type="number" class="form-control" name="accountno" id="accountno" maxlength="20" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>IFSC Code</label>
                                                                            <input type="text" class="form-control" name="ifsccode" id="ifsccode" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Branch Name</label>
                                                                            <input type="text" class="form-control" name="branchname" id="branchname" />
                                                                        </div>
                                                                    </div>
                                                                    <!-- <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Opening Balance</label>
                                                                            <input type="number" class="form-control" name="opendingbalance" id="opendingbalance" maxlength="15" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" />
                                                                        </div>
                                                                    </div> -->
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Is UPI Available?</label><br>
                                                                            <input type="radio" id="upiyes" name="upiavailable" value="upiyes">
                                                                            <label for="upiyes">Yes</label> &nbsp; &nbsp;
                                                                            <input type="radio" id="upino" name="upiavailable" value="upino">
                                                                            <label for="upino">No</label>
                                                                        </div>
                                                                    </div>
                                                                    <div id="upiid" class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>UPI Id</label><br>
                                                                            <input type="text" class="form-control" name="upiid" id="upiid" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Card Swiping Machine?</label><br>
                                                                            <input type="radio" id="cardmachineyes" name="cardmachine" value="cardmachineyes">
                                                                            <label for="cardmachineyes">Yes</label> &nbsp; &nbsp;
                                                                            <input type="radio" id="upino" name="cardmachine" value="cardmachineno">
                                                                            <label for="cardmachineno">No</label>
                                                                        </div>
                                                                    </div>
                                                                    <div id="machineid" class="col-xl-6">
                                                                        <div class="form-group">
                                                                            <label>Machine Id</label><br>
                                                                            <input type="text" class="form-control" name="machineinputid" id="machineinputid" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- <button type="button" id="btn-1" class="btn-copy btn btn-vasy">Add More +</button> -->
                                                            </div>
                                                        </div>
                                                        <div class="d-flex">
                                                            <div class="mr-2">
                                                                <button type="button" class="btn btn-vasy font-weight-bold text-uppercase px-9 py-4" data-wizard-type="action-prev" id="first_form_previous">
                                                                    Previous
                                                                </button>
                                                            </div>
                                                            <div>
                                                                <button type="button" class="btn btn-vasy font-weight-bold text-uppercase px-9 py-4" data-wizard-type="action-submit" id="first_form_submit">
                                                                    Submit
                                                                </button>
                                                                <button type="button" class="btn btn-vasy font-weight-bold text-uppercase px-9 py-4" data-wizard-type="action-next" id="first_form_next" >
                                                                    Next Step
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="receipt-sample">
                                                        <div class="receipt-logo">
                                                            <img src="http://simpleicon.com/wp-content/uploads/shop-4.png" alt="Logo" id="blah" class="col-6 offset-3 img-fluid client-logo">
                                                        </div>
                                                        <div class="receipt-head text-center py-4">
                                                            <h5 id="locationtext" class="font-weight-bold" style="text-transform: uppercase;">${CompanyVo.name}</h5>
                                                            <h6 id="brandnametext" class="font-weight-bold" style="text-transform: uppercase;">${CompanyVo.name}</h6>
                                                            <p id="addressprint">D-804, The First, Near ITC Narmada, Vastrapur</p>
                                                            <p id="citypincodeprint">Ahmedabad - 380015</p>
                                                            <p id="phoneprint">${CompanyVo.contactNo}</p>
                                                        </div>
                                                        <div class="receipt-content">
                                                            <table class="invoice-sample">
                                                                <tr>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td class="grey-bg">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="receipt-foot text-center pt-4">
                                                            <h5 class="font-weight-bold">Receipt Example</h5>
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
        </div>
	</div>

<!--begin::Base Scripts -->

<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/dashboard/assets/scripts/main.87c0748b313a1dda75f5.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
        type="text/javascript"></script>

<script src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.1/clipboard.min.js"></script>

<%--   <script src="<%=request.getContextPath()%>/assets/vendors/custom/formvalidation/formValidation.min.js" type="text/javascript"></script>
 <script src="<%=request.getContextPath() %>/assets/vendors/custom/formvalidation/framework/bootstrap.min.js"></script> --%>

   


<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/dashboard/assets/scripts/main.87c0748b313a1dda75f5.js"></script> --%>
<!--end::Base Scripts -->

<%-- <script src="<%=request.getContextPath()%>/assets/app/js/dashboard.js" type="text/javascript"></script> --%>

</body>
<!-- end::Body -->
</html>