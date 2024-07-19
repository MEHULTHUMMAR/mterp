<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>

    <head>

        <%@include file="../header/head.jsp" %>

        <title>${enquiryVo.prefix} ${enquiryVo.enquireNo}</title>

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
                            <h3 class="m-subheader__title m-subheader__title--separator">${enquiryVo.prefix}${enquiryVo.enquireNo}</h3>

                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home">
                                    <a href="/" class="m-nav__link m-nav__link--icon">
                                        <i class="m-nav__link-icon la la-home"></i>
                                    </a>
                                </li>
                                <li class="m-nav__separator">-</li>
                                <li class="m-nav__item">
                                    <a href="/enquire" class="m-nav__link">
                                        <span class="m-nav__link-text">Enquire</span>
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

                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-6 col-md-6 col-sm-12">

                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Customer Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${enquiryVo.contactVo.companyName}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Address: </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12" id="purchase_billing_address">
                                                                <input type="hidden" name="billingAddressId"
                                                                       id="billingAddressId" value="${enquiryVo.billingAddressId}"/>
                                                                <p class="mb-0"><span data-address-line-1=""></span></p>
                                                                <p class="mb-0">
                                                                    <span data-address-pincode=""></span> <span
                                                                        data-address-city=""></span> <span
                                                                        class="m--font-boldest">,&nbsp;</span>
                                                                </p>
                                                                <p class="mb-0">
                                                                    <span data-address-state=""></span> <span
                                                                        class="m--font-boldest">,&nbsp;</span> <span
                                                                        data-address-country=""></span>
                                                                </p>
                                                            </td>

                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Enquire Date:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${enquiryVo.enquireDate}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Enquiry No.:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${enquiryVo.prefix}${enquiryVo.enquireNo}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Notes.:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${enquiryVo.description}</td>
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
                                                        Product Details
                                                    </h3>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="m-portlet__body">

                                            <div class="row  m--margin-top-20">
                                                <div class="col-lg-12 col-md-12 col-sm-12 table-responsive">

                                                    <table class="table m-table">
                                                        <thead>
                                                        <tr>
                                                            <th style="width: 100px;">#</th>
                                                            <th style="width: 100px;">Product</th>
                                                            <th style="width: 100px;">Qty</th>
                                                            <th style="width: 100px;">Remark</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <c:set var="index" scope="page" value="0"/>
                                                            <c:forEach items="${enquiryVo.enquireItemVos}" var="enquireItemVos">
                                                                <tr class="">
                                                                    <td  style="width: 100px;">
                                                                         ${index+1}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                        ${enquireItemVos.productVo.productName}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                       ${enquireItemVos.qty}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                         ${enquireItemVos.remark}
                                                                    </td>

                                                                </tr>
                                                                <c:set var="index" scope="page" value="${index+1}"/>
                                                            </c:forEach>
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

            getContactInfo(${enquiryVo.contactVo.contactId});

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


        function getContactInfo(id) {
                $.post("/contact/" + id + "/address", {}, function (data, status) {
                    if (data.length > 0) {
                        $.each(data, function (key, value) {
                            if (value.contact_address_id = $("#billingAddressId").val()) {
                                $("#purchase_billing_address").find("[data-address-line-1]").html(value.address).end()
                                    .find("[data-address-pincode]").html(value.pin_code).end()
                                    .find("[data-address-city]").html(value.city_name).end()
                                    .find("[data-address-state]").html(value.state_name).end()
                                    .find("[data-address-country]").html(value.countries_name).end()
                                    .removeClass("m--hide").end()
                                    .find("[data-address-message]").addClass("m--hide").end();
                            }
                        });
                    }
                });
        }
    </script>
    </body>
<!-- end::Body -->
</html>




