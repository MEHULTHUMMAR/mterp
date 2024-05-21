<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Drawing Logic</title>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Drawing Logic
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
                                    <div class="m-portlet__head-title">
                                        <a href="#" data-toggle="modal" data-target="#drawinglogic_new_modal"
                                           class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                            <span><i class="la la-plus"></i><span>New Drawing Logic</span></span>
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

                                </div>
                            </div>
                            <div class="m-portlet__body remove_head_space_2">
                                <div class="m-form m-form--label-align-right collapse" id="m_datatable_group_action_form">
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
                                                                onclick="resetPointsForMultipleContact()">
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

                                        <th>#</th>
                                        <th>Drawing Logic NO</th>
                                        <th>Product Name</th>
                                        <th>File</th>
                                        <th>Remark</th>
                                        <th>GA</th>
                                        <th>Remark</th>

                                        
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
    <div class="modal fade" id="contact_upload_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	                            <input type="hidden" id="displayContactType" name="displayContactType" value="${displayContactType}"/>
	                                <input type="text" class="form-control form-control-sm" name="fileTextBox" id="fileTextBox"
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
	                <button type="button" class="btn btn-sm btn-secondary float-right" data-dismiss="modal">Cancel</button>
	                <!-- <button type="button" id="importExcel" class="btn btn-sm btn-info" disabled>Upload</button> -->
	            </div>
	        </div>
	    </div>
	</div>
	<%@include file="../footer/footer.jsp" %>

    <%@include file="drawing-logic-doc-new.jsp" %>

</div>
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script type="text/javascript">
    var table;
    var selectContactId=null;

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
                    url: "<%=request.getContextPath()%>/drawinglogic/customdatatable",
                    type: "POST",
                },
                lengthMenu: [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
                columns: [
                    {
                    data: "drawingLogicDocId"
                }, {
                    data: "drawingLogicDocNo"
                }, {
                    data: "productVo.productName"
                }, {
                    data: "fileName"
                }, {
                    data: "description"
                }, {
                        data: "gaFlag"
                    }, {
                    data: "drawingLogicDocId"
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
                        return t.prefix+t.drawingLogicDocNo;
                    }
                }, {
                    targets: 2,
                    orderable: !1,
                    render: function (a, e, t, n) {
                        return a;
                    }
                }, {
                        targets: 3,
                        orderable: !1,
                        render: function (a, e, t, n) {
                            return '<a href="/drawinglogic/download?fileName='+a+'">'+a+'</a>';
                        }
                    }, {
                        targets: 5,
                        orderable: !1,
                        render: function (a, e, t, n) {
                            return a==1?'Yes':'No';
                        }
                    },{
                    
                    targets: 6, // index of the "Actions" column (zero-based index)
                    orderable: false,
                   render: function (a, e, t, n) {
                    //    console.log(a)
                  return  '<i class="fa fa-trash text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="delete"  onclick="deleteproduct(' + a + ')" style="cursor: pointer; color:gray;"></i> ';
                     }
                }],
            })
        }
    };

   
     $(document).ready(function() {


       DatatablesDataSourceHtml.init();
       $(".dt-buttons").addClass("m--hide");

         $('#drawinglogic_new_modal').on('shown.bs.modal', function () {
             $("#productId").select2();
        //     $('#drawinglogic_new_form').formValidation('resetForm', true);
         });
         $("#docFile").on("change", function () {
             $("#updateFileTextBox").val(this.value.substring(this.value.lastIndexOf("\\") + 1));
         });

         $("#savedrawinglogic").click(function () {
             mApp.block("#drawinglogic_new_modal .modal-content",
                 {
                     overlayColor: "#464b66",
                     type: "loader",
                     state: "success",
                     message: "Please wait..."
                 });
             if ($("#productId").val() == "0") {
                 toastr.error("Please Select Product.");
                 mApp.unblock("#drawinglogic_new_modal .modal-content");
                 return false;
             } else {
                     var formdata = new FormData($("#drawinglogic_new_form")[0]);
                     $.ajax({
                         url: "/drawinglogic/savedrawinglogic",
                         type: "POST",
                         data: formdata,
                         encType: "multipart/form-data",
                         contentType: false,
                         processData: false,
                         success: function (data) {
                             toastr["success"]("Record Inserted....");
                             $('#drawinglogic_new_modal').modal('toggle');
                             location.reload();
                         },
                         error: function () {
                             mApp.unblock("#drawinglogic_new_modal .modal-content");
                         }
                     });

             }
         });

    });

    function clickUpdateFileBtn() {
        $("#docFile").trigger("click");
    }

    var totalFiles_edit=0;
    var mainIndex_edit=0;
    function updateproduct(id) {

        $.ajax({
            url: "/product/getdata/"+id,
            type: "GET",
            success: function (data) {
                //console.log(data);
                $("#product_edit_form").resetForm();
                $("#all_prodcut_tbl_edit").find("[data-purchase-item]").not(".m--hide").remove();
                totalFiles_edit=0;
                mainIndex_edit=0;
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
                if(data.certificateRequired==1){

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
            url: "/product/getdata/"+id,
            type: "GET",
            success: function (data) {
               // console.log(data);
                $("#categoryId_view").select2();
                $("#unit_view").select2();
                totalFiles_edit=0;
                mainIndex_edit=0;
                $("#all_prodcut_tbl_view").find("[data-purchase-item]").not(".m--hide").remove();

                $("#product_id_view").val(id);
                $("#itemcode_view").val(data.itemcode);
                $("#productName_view").val(data.productName);
                $("#displayName_view").val(data.displayName);
                $("#categoryId_view").val(data.categoryVo.categoryId).trigger('change');
                $("#capacity1_view").val(data.capacity1);
                $("#capacity2_view").val(data.capacity2);
                $("#unit_view").val(data.unit).trigger('change');
                if(data.certificateRequired==1){

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
                    $("#file_download"+mainIndex_edit).attr("href", value.filePath+value.fileName)
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
                    url: "/drawinglogic/delete",
                    type: "POST",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        if (data) {
                            toastr["success"]("Record deleted....");
                            location.reload();
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

</script>
</body>

<!-- end::Body -->
</html>

