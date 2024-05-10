<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header/head.jsp" %>
    <title>Category</title>
    <style type="text/css">
        #result {border: 1px solid #888;background: #f7f7f7;padding: 1em;margin-bottom: 1em;}
        select#datatableCustomTableLengthSelectBox {width: auto;float: right;}
    	.search-font {top: 7px !important;}
    	.select2-selection.select2-selection--single{height:calc(2.2125rem + 2px) !important;}
    	.select2-selection__rendered{font-size:.875rem;padding: 5px !important;line-height:1.6 !important;}
    	@media only screen and (max-width:767px){
			.m-portlet .m-portlet__head__sm{height:40px !important;}
			.m-body .m-content{padding-bottom:70px;}
			select#datatableCustomTableLengthSelectBox, select#datatableCustomTableLengthSelectBox2{display:none;}
		}
    </style>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Category</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                            	<a href="/" class="m-nav__link m-nav__link--icon"> <i class="m-nav__link-icon la la-home"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="m-content">
            	<div class="row">
                	<div class="col-md-12 mb-2">
                    	<div class="m-portlet mb-0">
                        	<div class="m-portlet__head m-portlet__head__sm">
                            	<div class="m-portlet__head-caption">
                                	<div class="m-portlet__head-title">
										<span class="m-portlet__head-icon"> <i class="flaticon-cogwheel-2"></i></span>
                                        <h3 class="m-portlet__head-text m--font-brand">Category</h3>
                                    </div>
                                </div>
                                <div class="m-portlet__head-caption ml-auto">
                                	<div class="m-portlet__head-title ml-2">
                                    	<select id="datatableCustomTableLengthSelectBox" class="form-control form-control-sm" data-toggle="tooltip" title="Show number of record">
	                                        <option value="10">10</option>
	                                        <option value="25">25</option>
	                                        <option value="50">50</option>
	                                        <option value="100">100</option>
	                                        <option value="200">200</option>
	                                        <option value="500">500</option>
	                                        <option value="-1">All</option>
                                        </select>
                                    </div>
                                    <div class="m-portlet__head-title ml-1">
                                        <div class="input-group input-group-sm">
                                        	<input type="text" class="form-control form-control-sm m-input search-icons" id="datatableCustomSearchInput" placeholder="Search List..." aria-describedby="basic-addon2">
                                        	<span class="search-font fa fa-search"></span>
                                         </div>
                                    </div>
                                    <div class="m-portlet__head-title ml-1">
                                        	<a href="#" class="btn btn-sm btn-primary m-btn m-btn--icon m-btn--air" data-toggle="modal" data-target="#category_new_model">Create New</a>
                                    </div>
                                </div>
                            </div>
                            <div class="m-portlet__body card-body-sm">
	                            <%@include file="category_model_new.jsp" %>
	                            <%@include file="category_model_update.jsp" %>
                                <div class="table-responsive">
                                	<table class="table table-sm table-striped table-bordered table-hover table-checkable" id="m_table_1">
                                    	<thead>
											<tr>
	                                            <th>#</th>
	                                            <th>Name</th>
	                                            <th >Actions</th>
	                                        </tr>
                                        </thead>
                                    	<tbody></tbody>
                                	</table>
                                </div>
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
<script src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>

<script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script>
    var table;
    function updatecategory(id) {
        $('#catupmodel').formValidation('resetForm', true);
        $('#upcatname').val($("#category_name"+id).val());
        $('#upcatid').val(id);
    }

    function deletecategory(id) {
        $.post("/category/deletecategory", {
            id: id
        }, function (data, status) {
            if(data == 'Sucess') {
                location.reload();
                toastr["success"]("Record Deleted....");
            } else if(data == 'accessdenied') {
                toastr["error"]("Access Denied....");
            } else if(data == '404') {
                toastr["error"]("Not Found!!!");
            } else {
                toastr["error"]("Something Went Wrong!!!");
            }

        });
    }
    
    $(document).ready(function () {

        $('#categorynewmodel').formValidation({
            framework: 'bootstrap',
            button: {
                selector: "#savecategory",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                category: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        },regexp: {
                            regexp: /^[A-Za-z0-9.@$\S\p{P}]+(?:[A-Za-z0-9.@$\S\p{P} ]*[A-Za-z0-9.@$\S\p{P}])?$/,
                            message: 'Space is not allow at the start and end of the word'
                        },
                        stringLength: {
                            max: 49,
                            message: 'The Name must be less than 50 characters long'
                        },
                        remote: {
                            message: 'This Name is already exist',
                            url: "/category/checkcategory",
                            type: 'POST'
                        }
                    }
                },
            }
        }).on('success.form.fv', function (e) {
            e.preventDefault();//stop the from action methods
            $.post("/category/savecategory", {
                name: $('#category').val(),
             }, function (data, status) {
               toastr["success"]
                ("Record Inserted....");
                $('#category_new_model').modal('toggle');
                location.reload(true);
            });

            $('#categorynewmodel').formValidation('resetForm', true);
            $('#category').val("");
        });

        $('#category_new_model').on('shown.bs.modal', function () {
            $('#categorynewmodel').formValidation('resetForm', true);
        });
        $("#savecategory").click(function () {
            $('#categorynewmodel').data('formValidation').validate();

        });

        $('#catupmodel').formValidation({
            framework: 'bootstrap',
            button: {
                selector: "#savecategory",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                catupname: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        },regexp: {
                            regexp: /^[A-Za-z0-9.@$\S\p{P}]+(?:[A-Za-z0-9.@$\S\p{P} ]*[A-Za-z0-9.@$\S\p{P}])?$/,
                            message: 'Space is not allow at the start and end of the word'
                        },
                        stringLength: {
                            max: 49,
                            message: 'The Name must be less than 50 characters long'
                        },
                        remote: {
                            message: 'This Name is already exist',
                            url: "/category/checkcategory",
                            type: 'POST',
                            data: function (validator, $field, value) {
                                return {
                                    categoryId: $('#upcatid').val(),
                                };
                            },
                        }

                    }
                },

            }
        }).on('success.form.fv', function (e) {
            e.preventDefault();//stop the from action methods
            $.post("/category/updatecategory", {
                name: $('#upcatname').val(),
                id: $('#upcatid').val(),
            }, function (data, status) {
                if(data) {
                    toastr["success"]("Record Updated....");
                    $('#m_modal_7').modal('toggle');
                    location.reload(true);
                    $('#catupmodel').formValidation('resetForm', true);
                } else {
                    toastr["error"]("Not Found!!!");
                }

            });
        });
        $('#updatecategory').click(function () {
            $('#catupmodel').data('formValidation').validate();

        });

    	 var DatatablesDataSourceAjaxServer = function () { 
             return {
                 init: function () { 
                     a = $("#m_table_1").DataTable({ 
                         responsive: !0,
                         pageLength: 10,
                         language: {
                             lengthMenu: "Display _MENU_"
                         },
                         searchDelay: 500,
                         processing: !0,
                         serverSide: true,
                         "ordering": false,
                         ajax: {
                             url: "<%=request.getContextPath()%>/category/datatable",
                             type: "POST",  
                         },
                         columns: [{
                             data: "categoryId"
                         },{
                             data: "categoryName"
                         },{
                             data: "categoryId"
                         }],
                         columnDefs: [ {
                             targets: 0, 
                             orderable: !1,
                             render: function (a, e, t, n) {
                                 return n.row + n.settings._iDisplayStart + 1;
                             }
                         },{
                             targets: 2,
                             orderable: !1,
                             render: function (data, e, row, n) {
                            	 var a = '<input type="hidden" id="category_name'+row.categoryId+'" value='+row.categoryName+'> ';
                                 	a +='<a data-toggle="modal" data-id="' + row.categoryId+ '" onClick="updatecategory('+ row.categoryId + ')" data-target="#m_modal_7" class="m-portlet__nav-link btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill" id="demo" title="Edit"> <i class="fa fa-edit"></i></a> ' ;
                                     a += '<a onclick="deletecategory('  + row.categoryId+ ')" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete"> <i class="fa fa-trash"></i></a>';
                             	return a;
                         }
                         }], 
                 })
                 }
             }
         }();

         DatatablesDataSourceAjaxServer.init();
         table = a;
     });

</script>

</body>
</html>