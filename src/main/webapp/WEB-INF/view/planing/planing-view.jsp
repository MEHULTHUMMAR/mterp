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

        <title>${planingVo.prefix} ${planingVo.planingNo}</title>

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
                            <h3 class="m-subheader__title m-subheader__title--separator">${planingVo.prefix}${planingVo.planingNo}</h3>

                            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                <li class="m-nav__item m-nav__item--home">
                                    <a href="/" class="m-nav__link m-nav__link--icon">
                                        <i class="m-nav__link-icon la la-home"></i>
                                    </a>
                                </li>
                                <li class="m-nav__separator">-</li>
                                <li class="m-nav__item">
                                    <a href="/planing" class="m-nav__link">
                                        <span class="m-nav__link-text">Planning</span>
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
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Enquiry No:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.enquireVo.prefix}${planingVo.enquireVo.enquireNo}</td>
                                                        </tr>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Customer Name:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.contactVo.name}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Address: </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.contactVo.address}, ${planingVo.contactVo.pincode}, ${planingVo.contactVo.cityCode}
                                                                ${planingVo.contactVo.stateCode},${planingVo.contactVo.countriesCode}</td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-lg-6 col-md-6 col-sm-12 m--padding-left-30">
                                                    <table class="table m-table">
                                                        <tbody>
                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Planning Date:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.planingDate}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Planning No.:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.prefix}${planingVo.planingNo}</td>
                                                        </tr>

                                                        <tr class="row">
                                                            <th scope="row" class="col-lg-4 col-md-4 col-sm-12">Notes.:
                                                            </th>
                                                            <td class="col-lg-8 col-md-8 col-sm-12">${planingVo.description}</td>
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
                                                            <th style="width: 100px;">Cost</th>
                                                            <th style="width: 100px;">Total</th>
                                                            <th style="width: 100px;">Drawing Login</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <c:set var="index" scope="page" value="0"/>
                                                        <c:set var="total_qty" value="0" scope="page"/>
                                                        <c:set var="total_value" value="0" scope="page"/>
                                                            <c:forEach items="${planingVo.planingItemVos}" var="planingItemVos">
                                                                <tr class="">
                                                                    <td  style="width: 100px;">
                                                                         ${index+1}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                        ${planingItemVos.productVo.productName}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                       ${planingItemVos.qty}
                                                                    </td>

                                                                    <td  style="width: 100px;">
                                                                         ${planingItemVos.remark}
                                                                    </td>
                                                                    <td  style="width: 100px;">
                                                                            ${planingItemVos.cost}
                                                                    </td>
                                                                    <td  style="width: 100px;">
                                                                        <c:set var="result" value="${planingItemVos.qty * planingItemVos.cost}"/>
                                                                        <c:set var="total_qty" value="${total_qty + planingItemVos.qty}"/>
                                                                        <c:set var="total_value" value="${total_value + result}"/>
                                                                            ${result}
                                                                    </td>
                                                                    <td  style="width: 100px;">
                                                                        <input type="hidden" id="planingItemId${planingItemVos.planingItemId}" value="${planingItemVos.planingItemId}">
                                                                        <input type="hidden" id="planingId${planingItemVos.planingItemId}" value="${planingVo.planingId}">
                                                                        <input type="hidden" id="enquireId${planingItemVos.planingItemId}" value="${planingVo.enquireVo.enquireId}">
                                                                        <input type="hidden" id="planingNo${planingItemVos.planingItemId}" value="${planingVo.prefix}${planingVo.planingNo}">
                                                                        <input type="hidden" id="enquireNo${planingItemVos.planingItemId}" value="${planingVo.enquireVo.prefix}${planingVo.enquireVo.enquireNo}">
                                                                        <input type="hidden" id="productId${planingItemVos.planingItemId}" value="${planingItemVos.productVo.productId}">
                                                                        <input type="hidden" id="productName${planingItemVos.planingItemId}" value="${planingItemVos.productVo.productName}">

                                                                        <c:if test="${planingItemVos.cost==0}">
                                                                        <a href="#" data-toggle="modal" onclick="openDrawingLogic(${planingItemVos.planingItemId})"
                                                                           data-id=" ${planingItemVos.planingItemId}" data-productId="${planingItemVos.productVo.productId}"
                                                                           class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                                                            <span><i class="la la-plus"></i><span>Generate</span></span>
                                                                        </a>
                                                                        </c:if>
                                                                    </td>

                                                                </tr>
                                                                <c:set var="index" scope="page" value="${index+1}"/>
                                                            </c:forEach>
                                                        </tbody>
                                                        <tfoot>
                                                        <tr>
                                                            <th style="width: 100px;"></th>
                                                            <th style="width: 100px;">Total</th>
                                                            <th style="width: 100px;">${total_qty}</th>
                                                            <th style="width: 100px;"></th>
                                                            <th style="width: 100px;"></th>
                                                            <th style="width: 100px;">${total_value}</th>
                                                            <th style="width: 100px;"></th>
                                                        </tr>
                                                        </tfoot>
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
        <%@include file="drawing-logic-modal.jsp" %>
        <%@include file="../footer/footer.jsp" %>
    </div>
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
        var index=0;
        $(document).ready(function () {

        });

        function openDrawingLogic(id){
            console.log(id);
            var product_id=$("#productId"+id).val();
            var planing_id=$("#planingId"+id).val();
            var enquire_id=$("#enquireId"+id).val();
            var planing_no=$("#planingNo"+id).val();
            var enquire_no=$("#enquireNo"+id).val();
            var product_name=$("#productName"+id).val();

            $("#dl_planingNo").html(planing_no);
            $("#dl_enquireNo").html(enquire_no);
            $("#dl_productName").html(product_name);
            $("#dl_planing_item_id").val(id);

            $("#product_table").find("[data-sales-item]").not(".m--hide").remove();
            $.post("/drawinglogic/getbyproduct/"+product_id+"/"+id, {}, function (data, status) {
                if (data) {
                    console.log(data)

                    $.each(data,function(index,data){


                        var $salesItemTemplate;
                        var mainIndex = index;
                        var selector = "{index}";
                        $salesItemTemplate = $("#product_table").find("[data-sales-item='template']").clone();
                        $salesItemTemplate.attr("data-sales-item", mainIndex).removeClass("m--hide");
                        $salesItemTemplate.find("[name='planingItemVos[" + selector + "].qty']").val(0).end()
                            .find("[name='planingItemVos[" + selector + "].remark']").val(0).end()
                            .find("[name='planingItemVos[" + selector + "].productVo.productId']").val(0).end();

                        $salesItemTemplate.find("input[type='hidden'],input[type='text'],textarea,button,select,span,a").each(function() {
                            n = $(this).attr("id");
                            n ? $(this).attr("id", n.replace(/{index}/g, index)) : "";
                            n = $(this).attr("name");
                            n ? $(this).attr("name", n.replace(/{index}/g, index)) : "";
                            $(this).attr("onchange") ? $(this).attr("onchange", $(this).attr("onchange").replace(/{index}/g, index)) : "";
                            $(this).attr("onkeyup") ? $(this).attr("onkeyup", $(this).attr("onkeyup").replace(/{index}/g, index)) : "";
                            $(this).attr("onclick") ? $(this).attr("onclick", $(this).attr("onclick").replace(/{index}/g, index)) : "";
                            $(this).attr("data-target") ? $(this).attr("data-target", $(this).attr("data-target").replace(/{index}/g, index)) : "";
                        });
                        $("#product_table").find("[data-sales-list]").append($salesItemTemplate);
                        $("#dlNo"+index).val(data.drawing_logic_doc_no);
                        $("#dlPDF"+index).attr('href','/drawinglogic/download?fileName='+data.file_name);
                        if(data.billofmaterial_id==0) {
                            $("#bom_generate" + index).attr('onclick', 'generateBOM(' + data.drawing_logic_doc_id + ')');
                            $("#bom_generate" + index).removeClass('m--hide');
                        }else{
                            $("#bom_link" + index).attr('href', '/bom/view/'+data.billofmaterial_id);
                            $("#bom_no" + index).html(data.bom_no);
                            $("#bom_link" + index).removeClass('m--hide');
                        }
                        $("#dlcosting"+index).val(data.costing);
                        setSrNo()
                        index++;
                    });
                }
            });
            $("#drawinglogic_modal").modal('show')
        }


        function setSrNo() {
            var $salesItem = $("#product_table").find("[data-sales-item]").not(".m--hide"),
                subTotal = 0.0;
            var i = 0;
            $salesItem.each(function() {
                $(this).find("[data-item-index]").html(++i);
        });
    }

    function generateBOM(dl_id){
            var dl_planing_item_id = $("#dl_planing_item_id").val();

            window.location.replace("/bom/generatebydl/"+dl_id+"/"+dl_planing_item_id);
    }

        function completeDL() {
            var id = $("#dl_planing_item_id").val();
            $.post("/planing/update/itemcost/" + id, {}, function (data, status) {
                location.reload();
            });
        }
    </script>
    </body>
<!-- end::Body -->
</html>