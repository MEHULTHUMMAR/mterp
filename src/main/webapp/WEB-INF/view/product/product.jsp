<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Product</title>
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

    <link
            href="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.css"
            rel="stylesheet" type="text/css"/>
</head>

<!-- begin::Body -->
<body
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Product
                        </h3>

                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home"><a href="/"
                                                                         class="m-nav__link m-nav__link--icon"> <i
                                    class="m-nav__link-icon la la-home"></i>
                            </a></li>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- END: Subheader -->

            <div class="m-content">

                <div class="row pt-0">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <!--begin::Portlet-->
                        <div class="m-portlet m-portlet--bordered-semi">
                            <div class="m-portlet__head remove_head_space_1">
                                <%--  <div class="col-md-3 mb-1 ">

                                          <a href="javascript:void()" class="btn btn-sm btn-primary mt-3" data-toggle="modal" data-target="#contact_upload_model"> <span><i class="fas fa-file-import"></i><span>&nbsp;&nbsp;Import</span></span></a>

                                  </div>--%>
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                    </div>
                                </div>
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <a href="#" data-toggle="modal" data-target="#product_new_modal"
                                           class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                            <span><i class="la la-plus"></i><span>New Product</span></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="m-portlet__head-caption ml-auto">
                                    <div class="m-portlet__head-title ml-2">

                                        <select id="datatableCustomTableLengthSelectBox"
                                                class="form-control form-control-sm" data-toggle="tooltip"
                                                title="Show number of record">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                            <option value="200">200</option>
                                        </select>
                                    </div>
                                    <div class="m-portlet__head-title ml-2">
                                        <div class="input-group input-group-sm ml-2">
                                            <input type="text" class="form-control m-input"
                                                   id="datatableCustomSearchInput" placeholder="Search List..."
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append"><span class="input-group-text"
                                                                                  id="basic-addon2"><i
                                                    class="fas fa-search"></i></span></div>
                                        </div>
                                    </div>
                                    <!-- <div class="m-portlet__head-title ml-2">
                                        <a href="#" class="btn btn-sm btn-primary m-btn m-btn--icon"
                                           data-toggle="dropdown" aria-expanded="true">
                                            <span><i class="fas fa-file-export"></i><span>Export</span></span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#" id="export_excel"
                                               data-skin="dark"
                                               title="Excel"> <i class="fa fa-file-excel"></i> Excel</a>
                                            <a class="dropdown-item" href="#" id="export_pdf"
                                               data-skin="dark"
                                               title="PDF"><i class="fa fa-file-pdf"></i> PDF</a>
                                        </div>

                                    </div> -->
                                </div>
                            </div>
                            <div class="m-portlet__body remove_head_space_2">
                                <div class="m-form m-form--label-align-right collapse"
                                     id="m_datatable_group_action_form">
                                    <div class="row align-items-center">
                                        <div class="col-xl-12 pb-3">
                                            <div class="m-form__group m-form__group--inline">
                                                <div class="m-form__label m-form__label-no-wrap">
                                                    <label class="m--font-bold m--font-danger-">
                                                        Selected <span id="m_datatable_selected_number"></span>
                                                        Records:
                                                    </label>
                                                </div>
                                                <div class="col-md-12 p-0">
                                                    <div class="btn-toolbar">
                                                        <button class="btn btn-danger m-btn btn-sm m-btn m-btn--icon"
                                                                type="button"
                                                                id="resetbtn"
                                                                onclick="resetPointsForMultipleContact()"
                                                        >
                                                            <i class="fa fa-trash mr-2"></i>Reset
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table
                                        class="table table-striped- table-bordered table-hover table-checkable "
                                        id="contact_table">
                                    <thead>
                                    <tr>
                                        <%--<th>
                                            <label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">
                                                <input type="checkbox" class="checkbox m-group-checkable" id="contactPoints"
                                                       name="contactPoints" value="0">
                                                <span></span>
                                            </label>
                                        </th>--%>
                                        <th>#</th>
                                        <th>Itemcode</th>
                                        <th>Product Name</th>
                                        <th>Display Name</th>
                                        <th>Category</th>
                                        <th>Sub Product</th>
                                        <th>Actions</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- loyalty modal code -->

    <!-- end loyalty modal code -->
    <!-- start import excel sheet modal -->
    <div class="modal fade" id="contact_upload_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header modal-header-sm">
                    <h5 class="modal-title" id="exampleModalLabel">Upload Sheet</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body modal-body-sm">
                    <form action="" method="post" enctype="multipart/form-data" id="formContent">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <label>Download <a class="text-primary" id="downloadDemoFile" style="cursor:pointer">Demo</a>
                                    File.</label>
                                <div class="input-group">
                                    <input type="hidden" id="displayContactType" name="displayContactType"
                                           value="${displayContactType}"/>
                                    <input type="text" class="form-control form-control-sm" name="fileTextBox"
                                           id="fileTextBox"
                                           readonly="readonly"/>
                                    <div class="input-group-append" onclick="clickFileBtn()" style="cursor:pointer">
														<span class="input-group-text">
															<i class="la la-file"></i>
														</span>
                                    </div>
                                    <input id="file-upload" name="excelFile" type="file" style="display: none;"
                                           required="required"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer modal-footer-sm">
                    <button type="button" id="testfile" class="btn btn-sm btn-warning">Verify</button>
                    <button type="button" class="btn btn-sm btn-secondary float-right" data-dismiss="modal">Cancel
                    </button>
                    <!-- <button type="button" id="importExcel" class="btn btn-sm btn-info" disabled>Upload</button> -->
                </div>
            </div>
        </div>
    </div>
    <!-- end import excel sheet modal -->
    <!-- start modal for selecting contacts -->

    <!-- end modal for selecting contacts -->
    <%@include file="../footer/footer.jsp" %>

    <%@include file="product-modal-new.jsp" %>
    <%@include file="product-modal-update.jsp" %>
    <%@include file="product-modal-view.jsp" %>
</div>
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/script/product/product-new-script.js?v=0.0.2"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/product/product-update-script.js?v=0.0.2"
        type="text/javascript"></script>
<script type="text/javascript">
    var table;
    var selectContactId = null;

    function clickFileBtn() {
        $("#file-upload").trigger("click");
    }

    var DatatablesDataSourceHtml = {
        init: function () {
            table = $("#contact_table").DataTable({
                responsive: !0,
                pageLength: 10,
                searchDelay: 500,
                processing: !0,
                serverSide: true,
                //scrollX:true,
                ajax: {
                    url: "<%=request.getContextPath()%>/product/customdatatable",
                    type: "POST",
                },
                lengthMenu: [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
                columns: [
                    {
                        data: "product_id"
                    }, {
                        data: "itemcode"
                    }, {
                        data: "product_name"
                    }, {
                        data: "display_name"
                    }, {
                        data: "category_name"
                    }, {
                        data: "is_sub_product"
                    }, {
                        data: "product_id"
                    }],
                columnDefs: [
                    {
                        targets: 0,
                        className: "text-center px-0 mx-0",
                        orderable: !1,
                        render: function (a, e, t, n) {
                            return n.row + n.settings._iDisplayStart + 1;
                        }
                    }, {
                        targets: 1,
                        orderable: !1,
                        render: function (a, e, t, n) {
                            return a
                        }
                    }, {
                        targets: 2,
                        orderable: !1,
                        render: function (a, e, t, n) {
                            return a;
                        }
                    }, {
                        targets: 5,
                        orderable: !1,
                        render: function (a, e, t, n) {
                            if(a==0){
                                return 'No';
                            }else{
                                return 'Yes';
                            }
                        }
                    }, {

                        targets: 6, // index of the "Actions" column (zero-based index)
                        orderable: false,
                        render: function (a, e, t, n) {
                            return '<i class="fa fa-eye text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="view" data-target="#product_view_modal" onclick="viewproduct(' + a + ')" style="cursor: pointer; color:gray;"></i> ' +
                                '<i class="fa fa-edit text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="edit" data-target="#product_edit_modal" onclick="updateproduct(' + a + ')" style="cursor: pointer; color:gray;"></i> ' +
                                '<i class="fa fa-trash text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="delete"  onclick="deleteproduct(' + a + ')" style="cursor: pointer; color:gray;"></i> ';
                        }
                    }],
            })
        }
    };


    $(document).ready(function () {
        DatatablesDataSourceHtml.init();
        $(".dt-buttons").addClass("m--hide");

        $("#subproductId").select2();

        $('#isSubProduct').change(function() {
            if(this.checked) {
                $("#subProductDiv").addClass('m--hide');
            }else{
                $("#subProductDiv").removeClass('m--hide');
            }
        });

        $("#all_prodcut_tbl").on("click", 'a[data-item-remove]', function (e) {
            $(this).closest("[data-purchase-item]").remove();
            var $purchaseItem = $("#all_prodcut_tbl").find("[data-purchase-item]").not(".m--hide");
            var i = 0;
            $purchaseItem.each(function () {
                $(this).find("[data-item-index]").html(++i);
            });
            document.getElementById('Filemessage').innerHTML =
                'Total Files: <b>' + i + '</b></br >';
        });

        $("#sub_product_tbl").on("click", 'a[data-item-remove]', function (e) {
            $(this).closest("[data-purchase-item]").remove();
            var $purchaseItem = $("#sub_product_tbl").find("[data-purchase-item]").not(".m--hide");
            var i = 0;
            $purchaseItem.each(function () {
                $(this).find("[data-item-index]").html(++i);
            });
        });

        $("#sub_product_tbl_edit").on("click", 'a[data-item-remove]', function (e) {
            $(this).closest("[data-purchase-item]").remove();
            var $purchaseItem = $("#sub_product_tbl_edit").find("[data-purchase-item]").not(".m--hide");
            var i = 0;
            $purchaseItem.each(function () {
                $(this).find("[data-item-index]").html(++i);
            });
        });
   });


    $("#contact_upload_model").on('hidden.bs.modal', function () {
        $("#fileTextBox").val("");
        $("#file-upload").val("");
    });
    $("#fileType").change(function () {
        var fileType = $("#fileType").val();
        $("#input-file-now").val("");
        if (fileType == 'image') {
            $('#input-file-now').attr('accept', 'image/*');
        } else if (fileType == 'audio') {
            $('#input-file-now').attr('accept', 'audio/*');
        } else if (fileType == 'video') {
            $('#input-file-now').attr('accept', 'video/*');
        } else if (fileType == 'file') {
            $('#input-file-now').attr('accept', 'image/jpeg/xls/csv');
        }

    });

    $("#file-upload").on("change", function () {
        $("#fileTextBox").val(this.value.substring(this.value.lastIndexOf("\\") + 1));
    });

    var totalFiles_edit = 0;
    var mainIndex_edit = 0;

    function updateproduct(id) {

        $.ajax({
            url: "/product/getdata/" + id,
            type: "GET",
            success: function (data) {
                data=data[0];
                $("#product_edit_form").resetForm();
                $("#all_prodcut_tbl_edit").find("[data-purchase-item]").not(".m--hide").remove();
                totalFiles_edit = 0;
                mainIndex_edit = 0;
                $("#categoryId_edit").select2();
                $("#unit_edit").select2();
                $("#subproductId_edit").select2();

                $("#product_id_edit").val(id);
                $("#itemcode_edit").val(data.itemcode);
                $("#productName_edit").val(data.product_name);
                $("#displayName_edit").val(data.display_name);
                $("#categoryId_edit").val(data.category_id).trigger('change');
                $("#capacity1_edit").val(data.capacity1);
                $("#capacity2_edit").val(data.capacity2);
                $("#unit_edit").val(data.unit).trigger('change');
                if (data.certificate_required == 1) {
                   $("#certificateRequired_edit").prop('checked', true);
                }else{
                    $("#certificateRequired_edit").prop('checked', false);
                }
                if (data.is_sub_product == 1) {
                    $("#isSubProduct_edit").prop('checked', true);
                    $("#subProductDiv_edit").addClass('m--hide');
                }else{
                    $("#isSubProduct_edit").prop('checked', false);
                    $("#subProductDiv_edit").removeClass('m--hide');
                }
                $("#description_edit").val(data.description);

                data.product_doc = JSON.parse(data.product_doc);
                $.each(data.product_doc, function (key, value) {

                    var $purchaseItemTemplate;
                    $purchaseItemTemplate = $("#all_prodcut_tbl_edit").find("[data-purchase-item='template']").clone();
                    $purchaseItemTemplate.find("[data-purchase-item-toggle]").remove();
                    $purchaseItemTemplate.attr("data-purchase-item", mainIndex_edit).removeClass("m--hide");
                    $purchaseItemTemplate.attr("id", mainIndex_edit);
                    $purchaseItemTemplate.find("input[type='text'],input[type='hidden'],button,select,span,textarea").each(function () {
                        n = $(this).attr("id");
                        n ? $(this).attr("id", n.replace(/{index}/g, mainIndex_edit)) : "";
                        n = $(this).attr("name");
                        n ? $(this).attr("name", n.replace(/{index}/g, mainIndex_edit)) : "";

                        $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{index}/g, mainIndex_edit)) : "";
                    });
                    $purchaseItemTemplate.append('<input type="hidden" id="productDocId_edit' + mainIndex_edit + '" name="productDocVos[' + mainIndex_edit + '].productDocId" value="' + id + '"/>')
                    $("#all_prodcut_tbl_edit").find("[data-purchase-list]").append($purchaseItemTemplate);
                    $("#srNo_edit" + mainIndex_edit).html(mainIndex_edit + 1);
                    $("#fileName_edit" + mainIndex_edit).val(value.file_name);
                    $("#remark_edit" + mainIndex_edit).val(value.remark);
                    $("#productDocId_edit" + mainIndex_edit).val(value.product_doc_id);
                    mainIndex_edit++;
                    totalFiles_edit++;
                });
                document.getElementById('Filemessage').innerHTML =
                    'Total Files: <b>' + totalFiles_edit + '</b></br >';

                mainIndex_edit = 0;
                if(data.sub_product!=null){
                data.sub_product = JSON.parse(data.sub_product);
                $("#sub_product_tbl_edit").find("[data-purchase-item]").not("[data-purchase-item='template']").remove();
                $.each(data.sub_product, function (key, value) {

                    var $purchaseItemTemplate;
                    $purchaseItemTemplate = $("#sub_product_tbl_edit").find("[data-purchase-item='template']").clone();
                    $purchaseItemTemplate.find("[data-purchase-item-toggle]").remove();
                    $purchaseItemTemplate.attr("data-purchase-item", mainIndex_edit).removeClass("m--hide");
                    $purchaseItemTemplate.attr("id", mainIndex_edit);
                    $purchaseItemTemplate.find("input[type='text'],input[type='hidden'],button,select,span,textarea,a").each(function () {
                        n = $(this).attr("id");
                        n ? $(this).attr("id", n.replace(/{p_index}/g, mainIndex_edit)) : "";
                        n = $(this).attr("name");
                        n ? $(this).attr("name", n.replace(/{p_index}/g, mainIndex_edit)) : "";

                        $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{index}/g, mainIndex_edit)) : "";
                    });
                    $purchaseItemTemplate.append('<input type="hidden" id="sub_product_tbl_id_edit' + mainIndex_edit + '" name="subProductVos[' + mainIndex_edit + '].subProductTBLId" value="' + value.sub_product_tbl_id + '"/>')
                    $("#sub_product_tbl_edit").find("[data-purchase-list]").append($purchaseItemTemplate);
                    $("#product_srNo_edit" + mainIndex_edit).html(mainIndex_edit + 1);
                    $("#product_Name_edit" + mainIndex_edit).html(value.product_name);
                    $("#sub_product_id_edit" + mainIndex_edit).val(value.sub_product_id);
                    mainIndex_edit++;
                });
                }
            },
            error: function () {

                toastr.error("There is Something went wrong...");
            }
        });


    }

    function viewproduct(id) {

        $.ajax({
            url: "/product/getdata/" + id,
            type: "GET",
            success: function (data) {
                data=data[0];
                $("#categoryId_view").select2();
                $("#unit_view").select2();
                totalFiles_edit = 0;
                mainIndex_edit = 0;
                $("#all_prodcut_tbl_view").find("[data-purchase-item]").not(".m--hide").remove();

                $("#product_id_view").val(id);
                $("#itemcode_view").val(data.itemcode);
                $("#productName_view").val(data.product_name);
                $("#displayName_view").val(data.display_name);
                $("#categoryId_view").val(data.category_id).trigger('change');
                $("#capacity1_view").val(data.capacity1);
                $("#capacity2_view").val(data.capacity2);
                $("#unit_view").val(data.unit).trigger('change');
                if (data.certificate_required == 1) {
                    $("#certificateRequired_view").prop('checked', true);
                }else{
                    $("#certificateRequired_view").prop('checked', false);
                }
                if (data.is_sub_product == 1) {
                    $("#isSubProduct_view").prop('checked', true);
                }else{
                    $("#isSubProduct_view").prop('checked', false);
                }
                $("#description_view").val(data.description);

                data.product_doc = JSON.parse(data.product_doc);
                $.each(data.product_doc, function (key, value) {

                    var $purchaseItemTemplate;
                    $purchaseItemTemplate = $("#all_prodcut_tbl_view").find("[data-purchase-item='template']").clone();
                    $purchaseItemTemplate.find("[data-purchase-item-toggle]").remove();
                    $purchaseItemTemplate.attr("data-purchase-item", mainIndex_edit).removeClass("m--hide");
                    $purchaseItemTemplate.attr("id", mainIndex_edit);
                    $purchaseItemTemplate.find("input[type='text'],input[type='hidden'],button,select,span,textarea,a").each(function () {
                        n = $(this).attr("id");
                        n ? $(this).attr("id", n.replace(/{index}/g, mainIndex_edit)) : "";
                        n = $(this).attr("name");
                        n ? $(this).attr("name", n.replace(/{index}/g, mainIndex_edit)) : "";

                        $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{index}/g, mainIndex_edit)) : "";
                    });
                    $purchaseItemTemplate.append('<input type="hidden" id="productDocId_view' + mainIndex_edit + '" name="productDocVos[' + mainIndex_edit + '].productDocId" value="' + id + '"/>')
                    $("#all_prodcut_tbl_view").find("[data-purchase-list]").append($purchaseItemTemplate);
                    $("#srNo_view" + mainIndex_edit).html(mainIndex_edit + 1);
                    $("#fileName_view" + mainIndex_edit).val(value.file_name);
                    $("#remark_view" + mainIndex_edit).val(value.remark);
                    $("#productDocId_view" + mainIndex_edit).val(value.product_doc_id);
                    $("#file_download" + mainIndex_edit).attr("href", '/product/download?fileName='+ value.file_name)
                    mainIndex_edit++;
                    totalFiles_edit++;
                });

                mainIndex_edit = 0;
                data.sub_product = JSON.parse(data.sub_product);
                $.each(data.sub_product, function (key, value) {

                    var $purchaseItemTemplate;
                    $purchaseItemTemplate = $("#sub_product_tbl_view").find("[data-purchase-item='template']").clone();
                    $purchaseItemTemplate.find("[data-purchase-item-toggle]").remove();
                    $purchaseItemTemplate.attr("data-purchase-item", mainIndex_edit).removeClass("m--hide");
                    $purchaseItemTemplate.attr("id", mainIndex_edit);
                    $purchaseItemTemplate.find("input[type='text'],input[type='hidden'],button,select,span,textarea,a").each(function () {
                        n = $(this).attr("id");
                        n ? $(this).attr("id", n.replace(/{p_index}/g, mainIndex_edit)) : "";
                        n = $(this).attr("name");
                        n ? $(this).attr("name", n.replace(/{p_index}/g, mainIndex_edit)) : "";

                        $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{index}/g, mainIndex_edit)) : "";
                    });
                    $purchaseItemTemplate.append('<input type="hidden" id="sub_product_tbl_id_view' + mainIndex_edit + '" name="subProductVos[' + mainIndex_edit + '].subProductTBLId" value="' + id + '"/>')
                    $("#sub_product_tbl_view").find("[data-purchase-list]").append($purchaseItemTemplate);
                    $("#product_srNo_view" + mainIndex_edit).html(mainIndex_edit + 1);
                    $("#product_Name_view" + mainIndex_edit).html(value.product_name);
                    $("#sub_product_id_view" + mainIndex_edit).val(value.sub_product_id);
                    mainIndex_edit++;
                });
            },
            error: function () {
                toastr.error("There is Something went wrong...");
            }
        });
    }

    function deleteproduct(id) {
        swal(
            {
                title: "",
                text: "Are you sure you want to delete this!",
                type: "info",
                showCancelButton: !0,
                confirmButtonText: "Yes, Delete this!"
            }).then(function (e) {
            if (e.value) {

                $.ajax({
                    url: "/product/delete",
                    type: "POST",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data) {
                            toastr["success"]("Record deleted....");
                            table.ajax.reload();
                        } else {
                            toastr.error("There is Something went wrong...");
                        }
                    },
                    error: function () {

                        toastr.error("There is Something went wrong...");
                    }
                });
            }
        });
    }

var pr_index=0;

    function addSubProduct(type) {
        var id='';
        if(type=='edit'){
            id='_edit';
        }

        if ($("#subproductId"+id).val() != null) {

            var $purchaseItem = $("#sub_product_tbl"+id).find("[data-purchase-item]").not(".m--hide");
            var repeat=true;
            $purchaseItem.each(function() {
                var pid=this.id;
               if($("#sub_product_id"+id + pid).val()==$("#subproductId"+id).val()){
                   repeat=false;
                }
            });

            if(repeat) {
                var $productTemplate;
                var mainIndex = pr_index;
                var selector = "{p_index}";
                $productTemplate = $("#sub_product_tbl"+id).find("[data-purchase-item='template']").clone();
                $productTemplate.find("[data-purchase-item-toggle]").remove();
                $productTemplate.attr("data-purchase-item", mainIndex).removeClass("m--hide");
                $productTemplate.attr("id", mainIndex);
                $productTemplate.find("input[type='text'],input[type='hidden'],select,span,textarea").each(function () {
                    n = $(this).attr("id");
                    n ? $(this).attr("id", n.replace(/{p_index}/g, mainIndex)) : "";
                    n = $(this).attr("name");
                    n ? $(this).attr("name", n.replace(/{p_index}/g, mainIndex)) : "";
                    $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{p_index}/g, mainIndex)) : "";
                });
                $("#sub_product_tbl"+id).find("[data-purchase-list]").append($productTemplate);
                $("#product_srNo"+id + pr_index).html(pr_index + 1);
                $("#product_Name"+id + pr_index).html($("#subproductId option:selected").text());
                $("#sub_product_id"+id + pr_index).val($("#subproductId").val());
                pr_index++;

                var i = 0;
                var $purchaseItem = $("#sub_product_tbl"+id).find("[data-purchase-item]").not(".m--hide");
                $purchaseItem.each(function () {
                    $(this).find("[data-item-index]").html(++i);
                });
                $("#subproductId"+id).val(0).trigger('change');
            }else{
                toastr.error("Sub Product already added.");
            }
        }
    }
</script>
</body>

<!-- end::Body -->
</html>

