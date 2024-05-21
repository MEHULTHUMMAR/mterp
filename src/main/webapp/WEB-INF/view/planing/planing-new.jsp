<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Planning</title>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Planning
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
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="planing_form" action="<%=request.getContextPath() %>/planing/save" method="post">

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
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Select Enquire <span style="font-size:1.25rem;" class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px" id="enquireVo" onchange="getEnquireInfo()"
                                                                        name="enquireVo.enquireId" placeholder="Select Enquire" >

                                                                <option value="0">Select Enquire</option>
                                                                <c:forEach items="${enquireList}" var="enquireList">
                                                                    <option value="${enquireList.enquire_id}"> ${enquireList.enquire_no} </option>
                                                                </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="m-section m--margin-bottom-15">
                                                        <label>Customer Name: </label>
                                                        <input type="hidden" id="contactId" name="contactVo.contactId">
                                                        <div class="m-section__content mb-0" id="contact_details">
                                                            <div class="row">
                                                                <p class="mb-0"><span customer_name=""></span></p>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="m-section m--margin-bottom-15">
                                                        <label>Address : </label>
                                                        <div class="m-section__content mb-0" id="purchase_billing_address">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12">
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

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-12">
                                                    <div class="form-group row">
                                                        <label class="col-lg-12 col-md-12 col-sm-12"> Planning Date<span style="font-size:1.25rem;" class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="input-group date">
                                                                <input type="text"
                                                                       class="form-control form-control-sm"
                                                                       name="planingDate" id="planingDate" onchange="changeDueDate()"
                                                                       data-date-format="dd/mm/yyyy" placeholder="dd/mm/yyyy"/>
                                                                    </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-4 col-sm-12">
                                                    <div class="form-group row">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Planning No.</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 m-form__group-sub">
                                                            <input type="text" readonly="readonly"
                                                                   class="form-control form-control-sm" name="prefix"
                                                                   placeholder="Prefix" value="${prefix}">
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-6 m-form__group-sub">
                                                            <input type="text" class="form-control form-control-sm"
                                                                   name="planingNo" id="planingNo"
                                                                   placeholder="Planing No" value="${planingNo}">
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
                                                                <th>Remark</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody data-sales-list="">
                                                            <tr data-sales-item="template" class="m--hide">

                                                                <td style="width: 50px;"><span data-item-index></span></td>

                                                                <td class="form-group mb-0 pname">
                                                                    <div class="d-flex">
                                                                        <select class="form-control" id="productId{index}"
                                                                                name="planingItemVos[{index}].productVo.productId"
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
                                                                               class="form-control form-control-sm qty"
                                                                               name="planingItemVos[{index}].qty" id="qty{index}"   placeholder="Qty" value="" />

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                <textarea rows="2" colspan="8" class="pro-desc " id="remark{index}"
                                                                          name="planingItemVos[{index}].remark" ></textarea>
                                                                </td>
                                                                <td style="min-width: 45px;">
                                                                    <a tabindex="-1" title="Delete" href="#" data-item-remove="" class="btn btn-outline-danger m-btn m-btn--icon m-btn--icon-only m-btn--pill mr-1">
                                                                        <i class="fa fa-times"></i>
                                                                    </a>
                                                                 </td>

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
                                                                <th></th>

                                                                <th><span id="totalQty"></span></th>
                                                                <th></th>
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
    var qtyValidator = {
        validators: {
            notEmpty: {
                message: 'The Qty is required'
            },
            greaterThan: {
                value: 0,
                inclusive: false, // Set to true if zero is allowed
                message: 'The Qty must be greater than 0'
            }
        }
    },productValidator = {
        validators: {
            notEmpty: {
                message: 'The Product is required'
            }
        }
    };
    $(document).ready(function () {
        $("#enquireVo").select2();
        $("#planingDate").datepicker({
            dateFormat: 'DD/MM/YYYY',
            autoApply:true,
            orientation: "auto bottom",
            setDate:'today'
        });

        $("#product_table").on("click", 'a[data-item-remove]', function (e) {
            var i = $(this).closest("[data-sales-item]").attr("data-sales-item");
            $('#planing_form').formValidation('removeField', "planingItemVos[" + i + "].qty");
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
                "enquireVo.enquireId": {
                    validators: {
                        notEmpty: {
                            message: 'The Enquire No is required.'
                        }
                    }
                },planingDate: {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'Select Planing Date '
                        },stringLength: {
                            min: 8,
                            message: 'The Date is not valid'
                        },regexp:{
                            regexp:/^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/,
                            message:'Date is not valid'
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
        $salesItemTemplate.find("[name='planingItemVos[" + selector + "].qty']").val(0).end()
            .find("[name='planingItemVos[" + selector + "].remark']").end()
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



    function getEnquireInfo() {
        if ($("#enquireVo").val() != "") {
            var id = $("#enquireVo").val();
            $.post("/enquire/" + id + "/getenquire-data", {}, function (data, status) {
                if (data) {
                    $("#contactId").val(data.contactVo.contactId);
                    $("#contact_details").find("[customer_name]").html(data.contactVo.name).end();
                    $("#product_table").find("[data-sales-item]").not("[data-sales-item='template']").remove();
                    $.each(data.enquireItemVos,function(index,data){


                        var $salesItemTemplate;
                        var mainIndex = index;
                        var selector = "{index}";
                        $salesItemTemplate = $("#product_table").find("[data-sales-item='template']").clone();
                        $salesItemTemplate.attr("data-sales-item", mainIndex).removeClass("m--hide");
                        $salesItemTemplate.find("[name='planingItemVos[" + selector + "].qty']").val(0).end()
                            .find("[name='planingItemVos[" + selector + "].remark']").end()
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

                        $('#planing_form').formValidation('addField', "planingItemVos[" + index + "].qty", qtyValidator);
                        $("#productId"+index).select2();
                        $("#productId"+index).append(new Option(data.productVo.productName, data.productVo.productId));
                        $("#productId"+index).val(data.productVo.productId);
                        $("#qty"+index).val(data.qty);
                        $("#remark"+index).val(data.remark);
                        setSrNo()
                        index++;


                    });


                }
            });
        }
    }

    function changeDueDate() {
        $('#planing_form').formValidation('revalidateField', "planingDate");
    }
</script>
</body>

<!-- end::Body -->
</html>