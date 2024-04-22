<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.erp.mterp.constant.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>Contact</title>
    <style type="text/css">
        .select2-container {
            display: block;
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Contact
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
                                <div class="col-md-3 mb-1 ">
                                  
                                        <a href="javascript:void()" class="btn btn-sm btn-primary mt-3" data-toggle="modal" data-target="#contact_upload_model"> <span><i class="fas fa-file-import"></i><span>&nbsp;&nbsp;Import</span></span></a>
                                    
                                </div>
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <%-- <a href="/contact/${type}/new"
                                           class="btn btn-primary btn-sm m-btn m-btn--icon"> <span><i
                                                class="la la-plus"></i><span> New ${displayContactType}</span></span>
                                        </a> --%>
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
                                        <th>
                                            <label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">
                                                <input type="checkbox" class="checkbox m-group-checkable" id="contactPoints"
                                                       name="contactPoints" value="0">
                                                <span></span>
                                            </label>
                                        </th>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Mobile No</th>
                                        <th>Email</th>
                                        <th>Point</th>
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
    <div class="modal fade" id="pointsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-sm">
                <h5 class="modal-title" id="exampleModalLabel">Points Adjustment</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" id="pointsForm" >
                <div class="modal-body modal-body-sm">
                    <div class="row" id="qty_div">
                        <div class="form-group col-md-6">
                            <label>In Points</label>
                            <input type="text"  class="form-control form-control-sm" 
                                   name="inPoints" placeholder="In Points" value="0" autocomplete="off" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label>Out Points</label>
                            <input type="text" class="form-control form-control-sm" 
                                   name="outPoints" 
                                   placeholder="Out Points" value="0" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="col-12 p-0 text-right">
                        <button type="button" id="addPointsBtn" class="btn btn-sm btn-primary">Add</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
 </div>
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
    <!-- end import excel sheet modal -->
    <!-- start modal for selecting contacts -->
    
    <!-- end modal for selecting contacts -->
	<%@include file="../footer/footer.jsp" %>
</div>
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>

<%@include file="../global/global-script.jsp" %>
<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
<script  src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
<script
src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script
src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script type="text/javascript">
    var table;
    var selectContactId=null;

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
                    url: "<%=request.getContextPath()%>/contact/customdatatable",
                    type: "POST",
                },
                lengthMenu: [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
                columns: [{
                    data: "contactManageId"
                },
                    {
                    data: "contactManageId"
                }, {
                    data: "contactName"
                }, {
                    data: "contactMobNo"
                }, {
                    data: "contactEmail"
                }, {
                    data: "points"
                }],
                columnDefs: [{
                    targets:0,
                    orderable: !1,
                    classname:"checkbox",
                    render: function(a,e,t,n){
                     var c = "";
                    c = '<label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">'
                    + '<input type="checkbox" class="checkbox  m-group-checkable" id="" name="" data-contactManageId ="' + t.contactManageId + '"  data-contactId ="' + t.contactId + '" value="' + t.contactId  + '">'
                    + '<span></span></label>';
                    return c;

                    }
                },
                    {
                    targets: 1,
                    className: "text-center px-0 mx-0",
                    orderable: !1,
                    render: function (a, e, t, n) {
                       return n.row + n.settings._iDisplayStart + 1;
                    }
                }, {
                    targets: 2,
                    orderable: !1,
                    render: function (a, e, t, n) {
                        return a
                    }
                }, {
                    targets: 5,
                    orderable: !1,
                    render: function (a, e, t, n) {
                        return a;
                    }
                },{
                    
                    targets: 6, // index of the "Actions" column (zero-based index)
                    orderable: false,
                   render: function (data, type, row) {
                    selectContactId=row.contactId;
                  return '<i class="fa fa-edit text-gray-500 mr-2 " data-toggle="modal" data-toggle="popover" title="edit" data-target="#pointsModal" onclick="setSelectedContactId(' + row.contactId + ')" style="cursor: pointer; color:gray;"></i> '+
                         '<i class="fas fa-redo text-red-500" id="resetpoints" data-toggle="popover" title="Reset" style="cursor: pointer; color:red;" onclick="resetPointsFnc(' + row.contactId + ')" ></i>'
                     }
                     
                }],
               
            })
        }
    };

   
     $(document).ready(function() {
       DatatablesDataSourceHtml.init();
       $(".dt-buttons").addClass("m--hide");
       
       $(document).on('click', '.fa-edit', function() {
       // Open the modal when the edit icon is clicked
      $('#pointsModal').modal('show');
      });

      $('#addPointsBtn').on('click', function() {
      var inPoints = $('input[name="inPoints"]').val(); 
      var outPoints = $('input[name="outPoints"]').val();
      console.log(selectContactId,"select contactId::::::::");
     console.log(inPoints,"inpoints ::::::::::");
       $.ajax({
      type: 'POST',
      url: '/contact/adjust/' + selectContactId, 
    
      data: {
        inPoints: inPoints ,
        outPoints: outPoints 
        },
      success: function(response) {
       toastr.success("Points has been adjusted successfully!");
        $("#contact_table").DataTable().ajax.reload()
        $('#pointsModal').modal('hide'); 
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
    $('#pointsModal').modal('hide'); 
    });
    $('#pointsForm').formValidation({
    framework: 'bootstrap',
    button: {
         selector: "#addPointsBtn",
         disabled: "disabled"
        },
    fields:{
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
    $('#pointsModal').on('hidden.bs.modal', function() {
        $(this).find("input").val('0')
     });
     $('#pointsModal').on('hide.bs.modal', function () {
    //    $('#pointsForm').data('formValidation').resetForm();
    //    $('#pointsForm')[0].reset()
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
			console.log(total+"::::"+tt)
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
   
    function resetPointsFnc(contactId) {
        let contactArray = [];
        contactArray.push(contactId)
        resetPointsAjaxFnc(contactArray.toString());
    }

    function resetPointsForMultipleContact() {
        $("#resetbtn").prop('disable',true);
        var conatctIDs = "";

        $(".checkbox").each(function () {
            if ($(this).prop('checked') == true) {
                if ($(this).val() != "" && $(this).val() != "0") {
                    conatctIDs = conatctIDs + $(this).val() + ",";
                    console.log("id:--" + conatctIDs);
                }
            }
        });
        swal({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            type: "warning",
            showCancelButton: !0,
            confirmButtonText: "Yes, delete it!"
        }).then(function (e) {
            if (e.value) {
               resetPointsAjaxFnc(conatctIDs)
            }else{
                $("#resetbtn").prop('disable',false);
            }
        });
    }

    function resetPointsAjaxFnc(contactIds) {
        
        $.ajax({
        url: '/contact/resetPoints?contactIds='+contactIds,
        type: 'DELETE',
        success: function(response) {
          toastr.success("Points has been Reset successfully");
          console.log(response);
          $("#resetbtn").prop('disable',false);
          $("#contact_table").DataTable().ajax.reload();
          $('#m_datatable_group_action_form').collapse("hide");

        },
        error: function(xhr, status, error) {
            toastr.error("something went wrong......!");
            $("#resetbtn").prop('disable',false);
        }
     });
    }
    $("#contact_upload_model").on('hidden.bs.modal', function () {
        	$("#fileTextBox").val("");
            $("#file-upload").val("");
        });
        $("#fileType" ).change(function() {
			var fileType = $("#fileType" ).val();
			$("#input-file-now").val("");
			console.log(fileType)
			if(fileType == 'image'){
				$('#input-file-now').attr('accept', 'image/*');
			}else if(fileType == 'audio'){
				$('#input-file-now').attr('accept', 'audio/*');
			}else if(fileType == 'video'){
				$('#input-file-now').attr('accept', 'video/*');
			}else if(fileType == 'file'){
				$('#input-file-now').attr('accept', 'image/jpeg/xls/csv');
			}
			
  		});
          $("#downloadDemoFile").click(function () {
         	var path="<%=request.getContextPath()%>/demoExcel/CustomerLoyaltyPoints.xlsx";
         	
             window.location.href = path;
         });
         $("#testfile").click(function () { 
             if ($("#file-upload").val() == "") {
                 toastr.error("Please Select file.");

                 return false;
             }else{
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
                             console.log(data,"DATA OF LOYALTY POINTS*******"); 
                              if (data.flag==false) {
                        
                                  toastr.info(data.wrongSheetMSG);
                                    mApp.unblock("#contact_upload_model .modal-content");
                                    $("#fileTextBox").val("");
                                    $("#file-upload").val("");
                              } else {
                                 if(data.totalWrongRows!=0){
                                   mApp.unblock("#contact_upload_model .modal-content");
  	                               if(data.totalWrongRows==data.totalRows){
  	                               	//toastr.error(data.wrongSheetMSG);
  	                                   var wrongDetailsMsg="";
	                            	   $.each(data.wrongSheetDTO, function (indexInArray, i) {  
	                            	      wrongDetailsMsg+="Row: "+i.rowno+"-"+i.reason+",";
	                            	   });  
	                            	   toastr.error(wrongDetailsMsg);
	                            	   $("#fileTextBox").val("");
	                                   $("#file-upload").val("");
  	                               	return false;
  	                               }
                                 var msg=data.totalWrongRows+" total Contact has issue do you want to upload rest of contact ?"
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
                                                        
  		                                		          data=JSON.parse(data);
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
  																	toastr.options.onclick = function() { 
  		                                                        	 location.reload();
  		                                                         }
  		                                                           mApp.unblock("#contact_upload_model .modal-content");
  		                                                         toastr["info"]("Contact imported successfully..!<br /><br /><button type='button' class='btn clear'>OK</button>", "")
  		                                                         window.location.href ="/pospdf/"+data.path;                                                                    
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
  		                               }else{
  		                               		
  		                               		  
  		                               		var msg="All data is validate do you want to add it"
  	                                 		swal(
  	  				                        {
  	  				                            title: msg,
  	  				                            
  	  				                            type: "info",
  	  				                            showCancelButton: !0,
  	  				                            confirmButtonText: "Yes, upload it!"
  	  				                        }).then(function (e) {
  	  				                        	console.log(e)
  	  				                        	if(e.value){
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
		                                             	data=JSON.parse(data);
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
																	toastr.options.onclick = function() { 
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
  	  				                        	}else{
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
         $("#file-upload")
            .on(
                "change",
                function () {
                    $("#fileTextBox")
                        .val(
                            this.value
                                .substring(this.value
                                    .lastIndexOf("\\") + 1));
                });
    // $('#resetbtn').click(function () {
    // var contactId = selectContactId; 
    // setSelectedContactId(contactId);
    // resetPointsFnc(contactId);
    // });
   
</script>
</body>

<!-- end::Body -->
</html>

