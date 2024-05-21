<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Enquire</title>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Enquire
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
                                        <a href="/enquire/new"  class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                            <span><i class="la la-plus"></i><span>New Enquire</span></span>
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
                                        <th>Enquire No</th>
                                        <th>Enquire Date</th>
                                        <th>Customer Name</th>
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
                    url: "<%=request.getContextPath()%>/enquire/customdatatable",
                    type: "POST",
                },
                lengthMenu: [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
                columns: [
                    {
                        data: "enquire_id"
                    }, {
                        data: "enquire_date"
                    }, {
                        data: "enquire_no"
                    }, {
                        data: "name"
                    }, {
                        data: "enquire_id"
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
                            return '<a href="/enquire/view/'+t.enquire_id+'">'+a+'</a>';
                        }
                    }, {

                        targets: 4, // index of the "Actions" column (zero-based index)
                        orderable: false,
                        render: function (a, e, t, n) {
                            return  '<a href="/enquire/edit/'+a+'"><i class="fa fa-edit text-gray-500 mr-2 "  style="cursor: pointer; color:gray;"></i></a> ' +
                                '<i class="fa fa-trash text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="delete"  onclick="deleteproduct(' + a + ')" style="cursor: pointer; color:gray;"></i> ';
                        }
                    }],
            })
        }
    };


    $(document).ready(function () {
        DatatablesDataSourceHtml.init();
        $(".dt-buttons").addClass("m--hide");

    });



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
                    url: "/enquire/delete",
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

</script>
</body>

<!-- end::Body -->
</html>

