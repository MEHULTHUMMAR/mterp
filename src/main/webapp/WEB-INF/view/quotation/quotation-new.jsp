<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Quotation</title>
    <style type="text/css">
        .select2-container {
            display: block;
        }

        input#file {
            margin: 10px;
            width: 100%;
            opacity: 0;
            color: transparent;
            height: 50px;
            cursor: pointer;
        }

        #uploadBulkFile {
            background: rgba(63, 135, 245, 0.1);
            border: 3px dashed #3f87f5;
            border-radius: 5px;
            position: relative;
        }

        #Filemessage {
            position: absolute;
            text-align: center;
            align-items: center;
            top: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
        }

        span.select2.select2-container.select2-container--default {
            width: 100% !important;
        }

        input#file_edit {
            margin: 10px;
            width: 100%;
            opacity: 0;
            color: transparent;
            height: 50px;
            cursor: pointer;
        }

        #uploadBulkFile_edit {
            background: rgba(63, 135, 245, 0.1);
            border: 3px dashed #3f87f5;
            border-radius: 5px;
            position: relative;
        }

        #Filemessage_edit {
            position: absolute;
            text-align: center;
            align-items: center;
            top: 50%;
            transform: translate(-50%, -50%);
            left: 50%;
        }
    </style>

    <link href="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.css"
          rel="stylesheet" type="text/css"/>
</head>

<!-- begin::Body -->
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Quotation
                        </h3>

                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home"><a href="/" class="m-nav__link m-nav__link--icon">
                                <i class="m-nav__link-icon la la-home"></i>
                            </a></li>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- END: Subheader -->

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="planing_form" action="<%=request.getContextPath() %>/quotation/save" method="post">

                <div class="row pt-0">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet">
                                <div class="m-portlet__body card-body-sm">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="form-group row p-0">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Select Planing No.<span style="font-size:1.25rem;" class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px" id="planingVo" onchange="getplaningInfo()"
                                                                        name="planingVo.planingId" placeholder="Select Enquire" >

                                                                <option value="0">Select Planing</option>
                                                                <c:forEach items="${planingList}" var="planingList">
                                                                    <option value="${planingList.planing_id}"> ${planingList.planing_no} </option>
                                                                </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="m-section m--margin-bottom-15">
                                                        <input type="hidden" id="contactId" name="contactVo.contactId">
                                                        <label>Customer Name :</label>

                                                        <div class="m-section__content mb-0" id="contact_details">
                                                            <div class="row">
                                                                <p class="mb-0"><span customer_name=""></span></p>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="m-section m--margin-bottom-15">
                                                        <label>Address</label>
                                                        <div class="m-section__content m--hide mb-0" id="purchase_billing_address">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                                    <input type="hidden" name="billingAddressId"
                                                                           id="billingAddressId" value="0"/>
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
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--  <button type="button" class="btn btn-link"
                                                                  data-toggle="m-popover" data-trigger="click"
                                                                  title="Billing Address <a href='#' data-popover-close='' class='m--font-bolder m-link m-link--state  m-link--danger float-right'>Cancel</a>"
                                                                  data-html="true" data-content=""
                                                                  id="billing_address_btn" tabindex="-1">Change Address
                                                          </button>--%>
                                                        <%-- </c:if> --%>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-12">
                                                    <div class="form-group row">
                                                        <label class="col-lg-12 col-md-12 col-sm-12"> Quotation Date<span style="font-size:1.25rem;" class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="input-group date">
                                                                <input type="text"
                                                                       class="form-control form-control-sm"
                                                                       name="quotationDate" id="quotationDate"
                                                                       data-date-format="dd/mm/yyyy" placeholder="dd/mm/yyyy"/>
                                                                    </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-4 col-sm-12">
                                                    <div class="form-group row">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Quotation No.</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 m-form__group-sub">
                                                            <input type="text" readonly="readonly"
                                                                   class="form-control form-control-sm" name="prefix"
                                                                   placeholder="Prefix" value="${prefix}">
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 m-form__group-sub">
                                                            <input type="text" class="form-control form-control-sm"
                                                                   name="quotationNo" id="quotationNo" readonly
                                                                   placeholder="Quotation No" value="${quotationNo}">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-8 col-md-8 col-sm-12">
                                                    <div class="form-group row">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Notes.</label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-12 m-form__group-sub">
                                                           <textarea class="form-control m-input" id="description" name="description"
                                                                     placeholder="Enter Description"></textarea>
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
                        <!--end::Portlet-->
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet m-portlet--tabs m-portlet--head-solid-bg m-portlet--head-sm">
                                <div class="m-portlet__head m-portlet__head__sm">
                                    <div class="m-portlet__head-tools w-100">
                                        <div class="col-md-10 pl-0">
                                            <ul
                                                    class="nav nav-tabs m-tabs-line m-tabs-line--primary m-tabs-line--2x"
                                                    role="tablist">
                                                <li class="nav-item m-tabs__item"><a
                                                        class="nav-link m-tabs__link active" data-toggle="tab"
                                                        href="#m_tabs_7_1" role="tab" tabindex="-1"> Product Details </a></li>

                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="m_tabs_7_1" role="tabpanel">
                                            <div class="row" id="productdetails-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="table-responsive">
                                                        <table class="table table-sm m-table table-bordered table-hover mb-0" id="product_table">
                                                            <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th >Product</th>
                                                                <th>Qty</th>
                                                                <th>Cost</th>
                                                                <th>Total</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody data-sales-list="">
                                                            <tr data-sales-item="template" class="m--hide">

                                                                <td style="width: 50px;"><span data-item-index></span></td>

                                                                <td class="form-group mb-0 pname" style="width: 100px;">
                                                                    <div class="d-flex">
                                                                        <select class="form-control" id="productId{index}"
                                                                                name="quotationItemVos[{index}].productVo.productId"
                                                                                placeholder="Select product">
                                                                            <option value="0">Select product</option>
                                                                            <c:forEach items="${productList}" var="productList">
                                                                                <option value="${productList.productId}"> ${productList.productName} </option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </td>

                                                                <td style="width: 100px;">
                                                                    <div class="p-0 m--font-bolder form-group mb-0"
                                                                         data-item-qty="">
                                                                        <input type="text"
                                                                               class="form-control form-control-sm qty" readonly=""
                                                                               name="quotationItemVos[{index}].qty" id="qty{index}"   placeholder="Qty" value="" />

                                                                    </div>
                                                                </td>
                                                                <td style="width: 100px;">
                                                                    <div class="p-0 m--font-bolder form-group mb-0"
                                                                         data-item-qty="">
                                                                        <input type="text"
                                                                               class="form-control form-control-sm qty"
                                                                               name="quotationItemVos[{index}].cost" id="cost{index}"   placeholder="Cost" readonly value="" />

                                                                    </div>
                                                                </td>
                                                                <td style="width: 100px;">
                                                                    <div class="p-0 m--font-bolder form-group mb-0"
                                                                         data-item-qty="">
                                                                        <input type="text"
                                                                               class="form-control form-control-sm qty"
                                                                               name="itemTotal{index}" id="itemtotal{index}"   placeholder="Total"  readonly value="" />

                                                                    </div>
                                                                </td>
                                                               <%-- <td style="min-width: 45px;">
                                                                    <a tabindex="-1" title="Delete" href="#" data-item-remove="" class="btn btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--pill mr-1">
                                                                        <i class="fa fa-times"></i>
                                                                    </a>
                                                                 </td>--%>

                                                            </tr>

                                                            </tbody>
                                                            <tfoot>

                                                            <tr>
                                                                <th style="width:70px;"></th>
                                                                <th><div class="m-demo-icon">
                                                                   <%-- <div class="m-demo-icon__preview ">
                                                                        <span class=""><i class="flaticon-plus m--font-primary"></i></span>
                                                                    </div>
                                                                    <div class="m-demo-icon__class">
                                                                        <a href="#" onclick="AddRowblank()" class="m-link m--font-boldest">Add
                                                                            Product</a>
                                                                    </div>--%>
                                                                </div></th>

                                                                <th>Tax Rate</th>
                                                                <th>
                                                                    <div class="d-flex">
                                                                        <select class="form-control" id="taxRate"
                                                                                name="taxRate" onchange="setAllTotal()"
                                                                                placeholder="Select Tax Rate">
                                                                            <option value="0">Select Tax Rate</option>
                                                                            <option value="0" selected> GST 0 </option>
                                                                            <option value="5" > GST 5 </option>
                                                                            <option value="12" > GST 12 </option>
                                                                            <option value="18" > GST 18 </option>
                                                                            <option value="28" > GST 28 </option>
                                                                        </select>
                                                                    </div>
                                                                </th>
                                                                <th>
                                                                    <span id="tax_amount"></span>
                                                                    <input type="hidden" id="taxAmount" name="taxAmount" value="0">
                                                                </th>
                                                               </tr>
                                                            <tr>
                                                                <th style="width:70px;"></th>
                                                                <th><div class="m-demo-icon">

                                                                </div></th>

                                                                <th>Total</th>
                                                                <th></th>
                                                                <th>
                                                                    <span id="total_amount"></span>
                                                                    <input type="hidden" id="total" name="total" value="0">
                                                                </th>
                                                            </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <footer class="m-grid__item	m-footer" style="min-height: 50px;height: 50px;position: fixed; bottom: 0; right: 0; left: 0;background-color:#282733;">
                                            <div
                                                    class="m-container m-container--fluid m-container--full-height m-page__container"
                                                    style="display: flex;">

                                                <div
                                                        style="justify-content: flex-end; flex: 1 1 0; display: flex; white-space: nowrap;">
                                                    <button type="button" class="btn btn-info" id="save_sales"
                                                            style="border-radius: .25rem" >Save
                                                    </button>

                                                </div>
                                            </div>
                                        </footer>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    <%@include file="../footer/footer.jsp" %>--%>
</div>
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $("#planingVo").select2();
        $("#taxRate").select2();
        $("#quotationDate").datepicker({
            dateFormat: 'DD/MM/YYYY',
            autoApply:true,
            orientation: "auto bottom",
            setDate:'today'
        });

        $("#product_table").on("click", 'a[data-item-remove]', function (e) {
            var i = $(this).closest("[data-sales-item]").attr("data-sales-item");

            // $('#sales_form').formValidation('removeField', "salesItemVos[" + i + "].productVarientsVo.productVarientId");
            // $('#sales_form').formValidation('removeField', "salesItemVos[" + i + "].freeQty");
            // $('#sales_form').formValidation('removeField', "salesItemVos[" + i + "].qty");

            $(this).closest("[data-sales-item]").remove();
            setSrNo();
            return false;
        });

        $("#save_sales").click(function (e) {
            $('#save_sales').prop('disabled', true);

            if ($("#product_table").find("[data-sales-item]").not(".m--hide").length == 0) {
                toastr.error("","Add minimum one product");
                $('#save_sales').prop('disabled', false);
                return false;
            } else {
                if ($('#planing_form').data('formValidation').isValid() == null) {
                    $('#planing_form').data('formValidation').validate();
                }
                if ($('#planing_form').data('formValidation').isValid() == true) {
                    $("#product_table").find("[data-sales-item='template']").remove();
                    document.getElementById("planing_form").submit();
                }else{
                    $('#save_sales').prop('disabled', false);
                    return false;
                }
            }

        });
        //----------Department------------
        $("#planing_form").formValidation({
            framework: 'bootstrap',
            button: {
                selector: "#save_sales",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                "planingVo.planingId": {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'The  Planing No. is required.'
                        }
                    }
                },quotationDate: {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'The Date is required. '
                        }
                    }
                }

            }
        });

        //----------End Department------------
    });


    var index=0;

    function AddRowblank() {

        var $salesItemTemplate;
        var mainIndex = index;
        var selector = "{index}";
        $salesItemTemplate = $("#product_table").find("[data-sales-item='template']").clone();
        $salesItemTemplate.attr("data-sales-item", mainIndex).removeClass("m--hide");
        $salesItemTemplate.find("[name='quotationItemVos[" + selector + "].qty']").val(0).end()
            .find("[name='quotationItemVos[" + selector + "].remark']").val(0).end()
            .find("[name='quotationItemVos[" + selector + "].productVo.productId']").val(0).end();

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
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].productVarientsVo.productVarientId", produstValidator);
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].freeQty", qtyValidator);
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].qty", qtyValidator);
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].price", priceValidator);
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].mrpToDiscount", discountValidator);
        // $('#sales_form').formValidation('addField', "salesItemVos[" + index + "].mrpTodiscountAdditional", discountValidator);
        $("#productId"+index).select2();
        setSrNo()
        index++;

    }

    function setSrNo() {
        var $salesItem = $("#product_table").find("[data-sales-item]").not(".m--hide"),
            subTotal = 0.0;
        var i = 0;
        $salesItem.each(function() {
            $(this).find("[data-item-index]").html(++i);

        });


    }



    function getplaningInfo() {
        if ($("#planingVo").val() != "") {
            var id = $("#planingVo").val();
            $.post("/planing/" + id + "/getplaning-data", {}, function (data, status) {
                if (data) {
                    console.log(data)
                    $("#contactId").val(data.contactVo.contactId);
                    $("#billingAddressId").val(data.billingAddressId);
                    $("#contact_details").find("[customer_name]").html(data.contactVo.companyName).end();
                    $("#purchase_billing_address").find("[data-address-line-1]").html(data.contactVo.address).end()
                        .find("[data-address-pincode]").html(data.contactVo.pincode).end()
                        .find("[data-address-city]").html(data.contactVo.cityName).end()
                        .find("[data-address-state]").html(data.contactVo.stateName).end()
                        .find("[data-address-country]").html(data.contactVo.countryName).end();

                    $.each(data.planingItemVos,function(index,data){


                        var $salesItemTemplate;
                        var mainIndex = index;
                        var selector = "{index}";
                        $salesItemTemplate = $("#product_table").find("[data-sales-item='template']").clone();
                        $salesItemTemplate.attr("data-sales-item", mainIndex).removeClass("m--hide");
                        $salesItemTemplate.find("[name='quotationItemVos[" + selector + "].qty']").val(0).end()
                            .find("[name='quotationItemVos[" + selector + "].remark']").val(0).end()
                            .find("[name='quotationItemVos[" + selector + "].productVo.productId']").val(0).end();

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
                        $("#productId"+index).select2();
                        $("#productId"+index).append(new Option(data.productVo.productName, data.productVo.productId));
                        $("#productId"+index).val(data.productVo.productId);
                        $("#qty"+index).val(data.qty);
                        $("#cost"+index).val(data.cost);
                        $("#itemtotal"+index).val(data.qty * data.cost );

                        setSrNo()
                        index++;


                    });
                    getContactInfo();
                    setAllTotal();

                }
            });
        }
    }

    function setAllTotal(){
        var $salesItem = $("#product_table").find("[data-sales-item]").not(".m--hide");
        var allTotal=0.0,total=0.0,taxamount=0.0;
        $salesItem.each(function() {
            var sales_item = $(this).attr("data-sales-item");
           var itemTotal = $("#itemtotal"+sales_item).val();
            allTotal+=parseFloat(itemTotal);
        });
        var tax_rate=$("#taxRate").val();
        if(!allTotal){allTotal=0}
        taxamount= ((parseFloat(allTotal) * parseFloat(tax_rate))/100);
        total=  parseFloat(allTotal) + parseFloat(taxamount);
        $("#tax_amount").html(taxamount.toFixed(2));
        $("#taxAmount").val(taxamount.toFixed(2));
        $("#total").val(total.toFixed(2));
        $("#total_amount").html(total.toFixed(2));
    }

    function getContactInfo() {
        if ($("#contactId").val() != "") {
            var id = $("#contactId").val();
            $.post("/contact/" + id + "/address", {}, function (data, status) {
                if (data.length > 0) {

                    var $template = $('#address_template'),
                        $clone = $template.clone().removeClass('m--hide').removeAttr('id').attr('id', "billing_address");
                    $addressList = $clone.find("[data-address-list]").clone();
                    $clone.find("[data-address-list]").html("");

                    $.each(data, function (key, value) {
                        if (value.contact_address_id == $("#billingAddressId").val()) {
                            $("#purchase_billing_address").find("[data-address-line-1]").html(value.address).end()
                                .find("[data-address-pincode]").html(value.pin_code).end()
                                .find("[data-address-city]").html(value.city_name).end()
                                .find("[data-address-state]").html(value.state_name).end()
                                .find("[data-address-country]").html(value.countries_name).end()
                                .removeClass("m--hide").end();
                            $("#billingAddressId").val(value.contact_address_id);
                        }

                        $addressItem = $addressList.clone();
                        $addressItem.find("[data-address-item]").attr("data-address-item", value.contact_address_id).end()
                            .find("[data-address-name]").html(value.contact_name).end()
                            .find("[data-address-line-1]").html(value.address).end()
                            .find("[data-address-pincode]").html(value.pin_code).end()
                            .find("[data-address-city]").html(value.city_name).end()
                            .find("[data-address-state]").html(value.state_name).end()
                            .find("[data-address-country]").html(value.countries_name).end()
                            .find("[data-address-city]").attr("data-address-city", value.city_code).end()
                            .find("[data-address-state]").attr("data-address-state", value.state_code).end()
                            .find("[data-address-country]").attr("data-address-country", value.countries_code).end()
                            .find("[data-address-phoneNo]").html(value.mob_no).end();

                        $clone.find("[data-address-list]").append($addressItem.html());
                    });
                    $clone.find("[data-change-address]").attr("data-change-address", "billing");
                    $("#billing_address_btn").attr("data-content", $clone.html());
                }
            });
        }
    }
</script>
</body>

<!-- end::Body -->
</html>