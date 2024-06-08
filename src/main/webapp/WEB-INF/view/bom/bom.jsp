<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Bill Of Material</title>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Bill of Material
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

                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                    </div>
                                </div>
                                <div class="m-portlet__head-caption">
                                  <%--  <div class="m-portlet__head-title">
                                        <a href="/bom/new"  class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                            <span><i class="la la-plus"></i><span>New Enquire</span></span>
                                        </a>
                                    </div>--%>
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped- table-bordered table-hover table-checkable "
                                       id="contact_table">
                                    <thead>
                                    <tr>
                                        <th>#</th>

                                        <th>Bill Of Material Date</th>
                                        <th>Bill Of Material No</th>
                                        <th>Drawing Logic No.</th>
                                        <th>Total</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>`
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../footer/footer.jsp" %>
</div>
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/script/enquire/enquire-new-script.js?v=0.0.2"   type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/enquire/enquire-update-script.js?v=0.0.2"  type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js" type="text/javascript"></script>
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
                    url: "<%=request.getContextPath()%>/bom/customdatatable",
                    type: "POST",
                },
                lengthMenu: [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
                columns: [
                    {
                        data: "billofmaterial_id"
                    }, {
                        data: "bom_date"
                    }, {
                        data: "bom_no"
                    }, {
                        data: "drawing_logic_doc_no"
                    }, {
                        data: "bom_total"
                    }, {
                        data: "billofmaterial_id"
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
                            return '<a href="/bom/view/'+t.billofmaterial_id+'">'+a+'</a>';
                        }
                    }, {

                        targets: 5, // index of the "Actions" column (zero-based index)
                        orderable: false,
                        render: function (a, e, t, n) {
                            console.log(a)
                            return  '<i class="fa fa-trash text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="delete"  onclick="deleteBOM(' + a + ')" style="cursor: pointer; color:gray;"></i> ';
                        }
                    }],
            })
        }
    };


    $(document).ready(function () {
        DatatablesDataSourceHtml.init();
        $(".dt-buttons").addClass("m--hide");

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

        $('#addPointsBtn').on('click', function () {
            var inPoints = $('input[name="inPoints"]').val();
            var outPoints = $('input[name="outPoints"]').val();
            console.log(selectContactId, "select contactId::::::::");
            console.log(inPoints, "inpoints ::::::::::");
            $.ajax({
                type: 'POST',
                url: '/contact/adjust/' + selectContactId,

                data: {
                    inPoints: inPoints,
                    outPoints: outPoints
                },
                success: function (response) {
                    toastr.success("Points has been adjusted successfully!");
                    $("#contact_table").DataTable().ajax.reload()

                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });

        });
        $('#pointsForm').formValidation({
            framework: 'bootstrap',
            button: {
                selector: "#addPointsBtn",
                disabled: "disabled"
            },
            fields: {
                inPoints: {
                    validators: {
                        notEmpty: {
                            message: 'The inpoints field is required'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'The inpoints field must contain only numbers'
                        }
                    }
                },
                outPoints: {
                    validators: {
                        notEmpty: {
                            message: 'The outpoints field is required'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'The outpoints field must contain only numbers'
                        }
                    }
                }
            }

        })


    });
    $("#contactPoints").click(function () {
        if ($("#contactPoints").prop('checked') == true) {
            $(".checkbox").prop('checked', true);
        } else {
            $(".checkbox").prop('checked', false);
        }
    });

    // $('#contact_table').on('draw.dt', function() {
    // 	//$('#contactPoints').prop('checked', false);
    // 	 $('#m_datatable_group_action_form').collapse("hide");
    // });
    $("#contact_table").on("click", ".checkbox", function () {

        var total = $('.checkbox:checked').length;
        var tt = $('.checkbox').length;
        console.log(total + "::::" + tt)
        if (total > 0) {
            $('#m_datatable_group_action_form').collapse("show");
            if ($("#contactPoints").prop('checked') == true) {
                total = total - 1;
            }
            $('#m_datatable_selected_number').html(total);
        } else {
            $('#m_datatable_group_action_form').collapse("hide");
        }


    });

    // Function to set the selected contact ID
    function setSelectedContactId(contactId) {
        selectContactId = contactId; // Update the value of selectContactId
    }

    $("#contact_upload_model").on('hidden.bs.modal', function () {
        $("#fileTextBox").val("");
        $("#file-upload").val("");
    });
    $("#fileType").change(function () {
        var fileType = $("#fileType").val();
        $("#input-file-now").val("");
        console.log(fileType)
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
    $("#downloadDemoFile").click(function () {
        var path = "<%=request.getContextPath()%>/demoExcel/CustomerLoyaltyPoints.xlsx";

        window.location.href = path;
    });
    $("#testfile").click(function () {
        if ($("#file-upload").val() == "") {
            toastr.error("Please Select file.");

            return false;
        } else {
            var fileExtension = ['xlsx'];

            if ($.inArray($("#file-upload").val().split('.').pop()
                    .toLowerCase(),
                fileExtension) == -1) {
                toastr.info("Only '.xlsx' formats are allowed.");
                mApp.unblock("#contact_upload_model .modal-content");
                $("#fileTextBox").val("");
                $("#file-upload").val("");
                return false;
            } else {
                mApp.block("#contact_upload_model .modal-content", {
                    overlayColor: "#464b66",
                    type: "loader",
                    state: "success",
                    message: "Sheet Verify..."
                });
                var formdata = new FormData($("#formContent")[0]);

                $.ajax({
                    url: "/contact/check/excel",
                    type: "POST",
                    data: formdata,
                    encType: "multipart/form-data",
                    contentType: false,
                    cache: false,
                    processData: false,
                    success: function (data) {
                        console.log(data, "DATA OF LOYALTY POINTS*******");
                        if (data.flag == false) {

                            toastr.info(data.wrongSheetMSG);
                            mApp.unblock("#contact_upload_model .modal-content");
                            $("#fileTextBox").val("");
                            $("#file-upload").val("");
                        } else {
                            if (data.totalWrongRows != 0) {
                                mApp.unblock("#contact_upload_model .modal-content");
                                if (data.totalWrongRows == data.totalRows) {
                                    //toastr.error(data.wrongSheetMSG);
                                    var wrongDetailsMsg = "";
                                    $.each(data.wrongSheetDTO, function (indexInArray, i) {
                                        wrongDetailsMsg += "Row: " + i.rowno + "-" + i.reason + ",";
                                    });
                                    toastr.error(wrongDetailsMsg);
                                    $("#fileTextBox").val("");
                                    $("#file-upload").val("");
                                    return false;
                                }
                                var msg = data.totalWrongRows + " total Contact has issue do you want to upload rest of contact ?"
                                swal(
                                    {
                                        title: msg,
                                        text: "You won't be able to revert this!",
                                        type: "info",
                                        showCancelButton: !0,
                                        confirmButtonText: "Yes, upload it!"
                                    }).then(function (e) {
                                    if (e.value) {

                                        mApp.block("#contact_upload_model .modal-content",
                                            {
                                                overlayColor: "#464b66",
                                                type: "loader",
                                                state: "success",
                                                message: "Sheet Uploading..."
                                            });
                                        $.ajax({
                                            url: "/contact/upload/excel/1",
                                            type: "POST",
                                            success: function (data) {

                                                data = JSON.parse(data);
                                                if (data.valid) {

                                                    mApp.unblockPage();
                                                    $("#fileTextBox").val("");
                                                    $("#file-upload").val("");
                                                    toastr.options = {
                                                        "closeButton": true,
                                                        "debug": false,
                                                        "newestOnTop": false,
                                                        "progressBar": false,
                                                        "positionClass": "toast-top-right",
                                                        "preventDuplicates": false,
                                                        "showDuration": "300",
                                                        "hideDuration": "1000",
                                                        "timeOut": 0,
                                                        "extendedTimeOut": 0,
                                                        "showEasing": "swing",
                                                        "hideEasing": "linear",
                                                        "showMethod": "fadeIn",
                                                        "hideMethod": "fadeOut",
                                                        "tapToDismiss": false
                                                    }
                                                    toastr.options.onclick = function () {
                                                        location.reload();
                                                    }
                                                    mApp.unblock("#contact_upload_model .modal-content");
                                                    toastr["info"]("Contact imported successfully..!<br /><br /><button type='button' class='btn clear'>OK</button>", "")
                                                    window.location.href = "/pospdf/" + data.path;
                                                } else {

                                                    mApp.unblockPage();
                                                    toastr.error("There is Something went wrong...");
                                                }
                                            },
                                            error: function () {

                                                mApp.unblockPage();
                                                toastr.error("There is Something went wrong...");
                                            }
                                        });
                                    }
                                });
                            } else {


                                var msg = "All data is validate do you want to add it"
                                swal(
                                    {
                                        title: msg,

                                        type: "info",
                                        showCancelButton: !0,
                                        confirmButtonText: "Yes, upload it!"
                                    }).then(function (e) {
                                    console.log(e)
                                    if (e.value) {
                                        toastr.success("Import started...");
                                        mApp.block("#contact_upload_model .modal-content",
                                            {
                                                overlayColor: "#464b66",
                                                type: "loader",
                                                state: "success",
                                                message: "Sheet Uploading..."
                                            });
                                        $.ajax({
                                            url: "/contact/upload/excel/0",
                                            type: "POST",
                                            success: function (data) {
                                                data = JSON.parse(data);
                                                if (data.valid) {
                                                    mApp.unblockPage();
                                                    $("#fileTextBox").val("");
                                                    $("#file-upload").val("");
                                                    toastr.options = {
                                                        "closeButton": true,
                                                        "debug": false,
                                                        "newestOnTop": false,
                                                        "progressBar": false,
                                                        "positionClass": "toast-top-right",
                                                        "preventDuplicates": false,
                                                        "showDuration": "300",
                                                        "hideDuration": "1000",
                                                        "timeOut": 0,
                                                        "extendedTimeOut": 0,
                                                        "showEasing": "swing",
                                                        "hideEasing": "linear",
                                                        "showMethod": "fadeIn",
                                                        "hideMethod": "fadeOut",
                                                        "tapToDismiss": false
                                                    }
                                                    toastr.options.onclick = function () {
                                                        location.reload();
                                                    }
                                                    toastr["info"]("Contact imported successfully..!<br /><br /><button type='button' class='btn clear'>OK</button>", "")
                                                } else {
                                                    mApp.unblockPage();
                                                    toastr
                                                        .error("There is Something went wrong...");
                                                }
                                            },
                                            error: function () {
                                                mApp.unblockPage();
                                                toastr.error("There is Something went wrong...");
                                            }
                                        });
                                    } else {
                                        mApp.unblock("#contact_upload_model .modal-content");
                                    }


                                });

                            }

                        }
                    }, error: function () {
                        mApp.unblock("#contact_upload_model .modal-content");
                    }
                });
            }
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
                console.log(data);
                $("#product_edit_form").resetForm();
                $("#all_prodcut_tbl_edit").find("[data-purchase-item]").not(".m--hide").remove();
                totalFiles_edit = 0;
                mainIndex_edit = 0;
                $("#categoryId_edit").select2();
                $("#unit_edit").select2();

                $("#product_id_edit").val(id);
                $("#itemcode_edit").val(data.itemcode);
                $("#productName_edit").val(data.productName);
                $("#displayName_edit").val(data.displayName);
                $("#categoryId_edit").val(data.categoryVo.categoryId).trigger('change');
                $("#capacity1_edit").val(data.capacity1);
                $("#capacity2_edit").val(data.capacity2);
                $("#unit_edit").val(data.unit).trigger('change');
                if (data.certificateRequired == 1) {

                    $("#certificateRequired_edit").prop('checked', true);
                }
                $("#description_edit").val(data.description);


                $.each(data.productDocVos, function (key, value) {

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
                    $("#fileName_edit" + mainIndex_edit).val(value.fileName);
                    $("#remark_edit" + mainIndex_edit).val(value.remark);
                    $("#productDocId_edit" + mainIndex_edit).val(value.productDocId);
                    mainIndex_edit++;
                    totalFiles_edit++;
                });
                document.getElementById('Filemessage').innerHTML =
                    'Total Files: <b>' + totalFiles_edit + '</b></br >';


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
                console.log(data);
                $("#categoryId_view").select2();
                $("#unit_view").select2();
                totalFiles_edit = 0;
                mainIndex_edit = 0;
                $("#all_prodcut_tbl_view").find("[data-purchase-item]").not(".m--hide").remove();

                $("#product_id_view").val(id);
                $("#itemcode_view").val(data.itemcode);
                $("#productName_view").val(data.productName);
                $("#displayName_view").val(data.displayName);
                $("#categoryId_view").val(data.categoryVo.categoryId).trigger('change');
                $("#capacity1_view").val(data.capacity1);
                $("#capacity2_view").val(data.capacity2);
                $("#unit_view").val(data.unit).trigger('change');
                if (data.certificateRequired == 1) {

                    $("#certificateRequired_view").prop('checked', true);
                }
                $("#description_view").val(data.description);


                $.each(data.productDocVos, function (key, value) {

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
                    $("#fileName_view" + mainIndex_edit).val(value.fileName);
                    $("#remark_view" + mainIndex_edit).val(value.remark);
                    $("#productDocId_view" + mainIndex_edit).val(value.productDocId);
                    $("#file_download" + mainIndex_edit).attr("href", value.filePath + value.fileName)
                    mainIndex_edit++;
                    totalFiles_edit++;
                });
                document.getElementById('Filemessage_view').innerHTML =
                    'Total Files: <b>' + totalFiles_edit + '</b></br >';


            },
            error: function () {

                toastr.error("There is Something went wrong...");
            }
        });


    }

    function deleteBOM(id) {
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
                    url: "/bom/delete",
                    type: "POST",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data) {
                            toastr["success"]("Record deleted....");
                            table.ajax.reload();
                        } else {
                            toastr.error("Planning for this BOM has already been completed.");
                        }
                    },
                    error: function () {

                        toastr.error("There is Something went wrong...");
                    }
                });
            }
        });
    }

</script>
</body>

<!-- end::Body -->
</html>

