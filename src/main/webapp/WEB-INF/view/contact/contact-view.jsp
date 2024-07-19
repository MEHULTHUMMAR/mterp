<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
        <%@include file="../header/head.jsp" %>
        <title>
             ${ContactDetails.companyName} |  Customer
        </title>
        <style type="text/css">
	    	select#datatableCustomTableLengthSelectBox {width: auto;float: right;}
	    	.select2-selection.select2-selection--single{height:calc(2.2125rem + 2px) !important;}
	    	.select2-selection__rendered{font-size:.875rem;padding: 5px !important;line-height:1.6 !important;}
	    	.select2-container--default .select2-selection--single .select2-selection__arrow{top:14px;}
	    	.bootstrap-tagsinput input[type="text"]{margin:0px;}
	    	span.tag.label-info{padding:2px 5px;}
	    	.paction a{height:20px !important;width:20px !important;}
		   	    div#bill_table_processing .loading, div#payment_table_processing .loading, div#debit_note_table_processing .loading{position:relative !important;}
		    button.dropdown-item{cursor:pointer;}
		    button.dropdown-item:hover{color:#36a3f7;}
            #overflowwithdot{word-break: break-all; /* Forces breaks within words */
                white-space: normal;}
	    </style>

        <style>
            .order-head-tab{order:0}
            .order-head-btn{order:1}
            
            @media (max-width: 1299px) { 
                .custom-port-head{flex-direction: column !important; }
                .order-head-tab{order:1}
                .order-head-btn{order:0; margin-top:5px;margin-left:auto;}
                .m-portlet__head__sm { height: auto !important;}

             }
            @media (max-width: 768px) { 
                .custom-port-head{display :flex !important;}
                .order-head-btn{margin-bottom:0 !important;}
             }
        </style>

	    <link href="https://cdn.datatables.net/buttons/1.5.0/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
        <div class="m-grid m-grid--hor m-grid--root m-page">
            <%@include file="../header/header.jsp" %>
            <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
                <%@include file="../header/navigation.jsp" %>
                <div class="m-grid__item m-grid__item--fluid m-wrapper">
                    <div class="m-subheader ">
                        <div class="d-flex align-items-center">
                            <div class="mr-auto">
                                <h3 class="m-subheader__title m-subheader__title--separator">
                                    ${ContactDetails.companyName}
                                    </h3>
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
                        </div>
                    </div>

                    <div class="m-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="m-portlet m-portlet--tabs mb-0">
                                    <div class="m-portlet__head m-portlet__head__sm custom-port-head">
                                        <div class="m-portlet__head-tools taab-lists order-head-tab">
                                            <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist">
                                                <li class="nav-item m-tabs__item">
                                                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="#general-details" role="tab">
                                                        General Details
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                            <div class="m-portlet__head-tools order-head-btn">
                                                        <a title="Edit" href="/contact/${ContactDetails.contactId}/edit" class="btn btn-info m-btn m-btn--icon m-btn--icon-only mr-1">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                       <button id="contact_delete" onclick="deleteContactDetails(${ContactDetails.contactId})" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only mr-1">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                            </div>
                                    </div>
                                    <div class="m-portlet__body card-body-sm">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="general-details" role="tabpanel">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <table class="table table-sm table-bordered table-hover table-checkable">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="font-weight-bold">Company Name</td>
                                                                    <td>
                                                                        <span  id="overflowwithdot" title="${ContactDetails.companyName}">
                                                                            ${ContactDetails.companyName}
                                                                        </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="font-weight-bold">Email</td>
                                                                    <td>
                                                                        <a href="mailto:${ContactDetails.email}">${ContactDetails.email}</a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                           </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="m-portlet m-portlet--tabs mb-0">
                                    <div class="m-portlet__head m-portlet__head__sm custom-port-head">
                                        <div class="m-portlet__head-tools taab-lists order-head-tab">
                                            <ul class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x" role="tablist">
                                                <li class="nav-item m-tabs__item">
                                                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="" role="tab">
                                                        Address Details
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>
                                    <div class="m-portlet__body card-body-sm">
                                        <div class="tab-content">
                                             <div class="" id="m_tabs_7_1" role="tabpanel">
                                                <div class="row">
                                                    <c:forEach items="${ContactDetails.contactAddressVos}" var="contactAddress" varStatus="status">
                                                        <input type="hidden" name="contactAddressId" id="contactAddressId" value="${contactAddress.contactAddressId}">
                                                        <div class="col-md-4">
                                                            <table class="table table-sm table-bordered table-hover table-checkable">
                                                                <tbody>
                                                                    <tr>
                                                                        <th>
                                                                            <c:if test="${contactAddress.isDefault==1}">Default Address</c:if>
                                                                            <c:if test="${contactAddress.isDefault==0}">Address Details</c:if>
                                                                        </th>
                                                                        <th class="text-right">
                                                                            <c:if test="${contactAddress.isDefault==0}">
                                                                                <div class="m-checkbox-inline">
                                                                                    <label class="m-checkbox m-checkbox--solid m-checkbox--brand" style="color:#fff !important">
                                                                                        <input type="checkbox" onchange="setAsDefault(${contactAddress.contactAddressId})" id="setAsDefault" name="setAsDefault" value=""> Set As Default
                                                                                        <span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </c:if>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="font-weight-bold">Contact Name</td>
                                                                        <td>${contactAddress.contactName}</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="font-weight-bold">Mobile No.</td>
                                                                            <td>${contactAddress.mobNo}</td>
                                                                    </tr>


                                                                    <tr>
                                                                        <td class="font-weight-bold">Address </td>
                                                                        <td>${contactAddress.address}</td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td class="font-weight-bold">Country</td>
                                                                        <c:forEach items="${CountryList}" var="CountryList">
                                                                            <c:if test="${CountryList.countriesCode == contactAddress.countriesCode}">
                                                                                <td>${CountryList.countriesName}</td>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="font-weight-bold">State</td>
                                                                        <c:forEach items="${StateList}" var="StateList">
                                                                            <c:if test="${StateList.stateCode == contactAddress.stateCode}">
                                                                                <td>${StateList.stateName}</td>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="font-weight-bold">City</td>
                                                                        <c:forEach items="${CityList}" var="CityList">
                                                                            <c:if test="${CityList.cityCode == contactAddress.cityCode}">
                                                                                <td>${CityList.cityName}</td>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </tr>

                                                                    <tr>
                                                                        <td class="font-weight-bold">ZIP/Postal Code</td>
                                                                        <td>${contactAddress.pinCode}</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </c:forEach>
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
        

        <!-- Include Footer -->
        <%@include file="../footer/footer.jsp" %>
        <div id="targetDiv"></div>
    </div>
    <!-- end:: Page -->

    <!--begin::Base Scripts -->
    <script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js"></script>
    <script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js"></script>
    <%@include file="../global/global-script.jsp" %>

    <script>

        $(document).ready(function () {
                    });

        function setAsDefault(id) {
            $.post('/contact/${ContactDetails.contactId}/updateDefaultAddress/' + id,
                function (data, status) {
                    location.reload();
                });
        }

        function deleteContactDetails(id) {
            var u = '/contact/'+ id + '/delete';
            swal({
                title: "Are You Sure?",
                text: "You Won't be Able to Revert This!",
                type: "warning",
                showCancelButton: !0,
                confirmButtonText: "Yes, Delete It!"
            }).then(function (e) {
                if (e.value) {
                        $.ajax({
                            url: u,
                            type: "POST",
                            success: function(data, status) {
                                if (data.status) {
                                    window.location.href = "/contact";
                                } else {
                                    swal({
                                        title: "Sorry",
                                        text: data.message,
                                        type: "warning",
                                    });
                                }
                            },
                            error: function(XMLHttpRequest, textStatus, errorThrown) {
                                if (XMLHttpRequest.status == 0) {
                                    toast("ERROR", ' Check Your Network.');
                                } else if (XMLHttpRequest.status == 404) {
                                    toast("ERROR", 'Requested URL not found.');
                                } else if (XMLHttpRequest.status == 500) {
                                    toast("ERROR", 'Internel Server Error.');
                                } else {
                                    toast("ERROR", 'Unknow Error.\n' + XMLHttpRequest.responseText);
                                }
                            }
                        });

                }
            })
        }
        </script>
    </body>
</html>