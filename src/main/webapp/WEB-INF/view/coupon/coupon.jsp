<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
      <%@include file="../header/head.jsp" %>
      <title>Coupon</title>
      <link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet" type="text/css"/>
      <link href="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css"/>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Coupon</h3>
                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                           <li class="m-nav__item m-nav__item--home">
                              <a href="<%=request.getContextPath() %>/dashboard"
                                 class="m-nav__link m-nav__link--icon">
                              <i class="m-nav__link-icon la la-home"></i>
                              </a>
                           </li>
                           <li class="m-nav__separator">-</li>
                           <li class="m-nav__item">
                              <a href="<%=request.getContextPath()%>/dashboard" class="m-nav__link">
                              <span class="m-nav__link-text">Dashboard</span>
                              </a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="m-content">
                  <div class="row">
                     <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="m-portlet">
                           <div class="m-portlet__head">
                              <div class="m-portlet__head-caption">
                                 <div class="m-portlet__head-title">
                                    <a href="#" data-toggle="modal" data-target="#coupon_new_modal"
                                       class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air">
                                    <span><i class="la la-plus"></i><span>New Coupon</span></span>
                                    </a>
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
                                    </select>
                                 </div>
                                 <div class="m-portlet__head-title ml-2">
                                    <div class="input-group input-group-sm ml-2">
                                       <input type="text" class="form-control m-input" id="datatableCustomSearchInput" placeholder="Search List..." aria-describedby="basic-addon2">
                                       <div class="input-group-append"><span class="input-group-text" id="basic-addon2">
                                          <i class="fas fa-search"></i></span>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="m-portlet__body">
                              <div class="m_datatable">
                                 <table class="table table-striped- table-bordered table-hover table-checkable" id="coupon_table">
                                    <thead>
                                       <tr>
                                          <th>#</th>
                                          <th>Coupon Type</th>
                                          <th>Points</th>
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
         </div>
         <%@include file="../footer/footer.jsp" %>
            <%@include file="coupon-modal-new.jsp" %>
         <%@include file="coupon-modal-update.jsp" %>
      </div>
      <script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
      <script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
      <script src="https://cdn.rawgit.com/ccampbell/mousetrap/825ce50c/mousetrap.min.js"></script>
      <%@include file="../global/global-script.jsp" %>
      <script src="<%=request.getContextPath()%>/script/jquery.spring-friendly.js" type="text/javascript"></script>
      <script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
      <script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
      <script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>
      <script src="<%=request.getContextPath()%>/script/coupon/coupon-new-script.js?v=0.0.2" type="text/javascript"></script>
      <script src="<%=request.getContextPath()%>/script/coupon/coupon-update-script.js?v=0.0.2" type="text/javascript"></script>
      <script type="text/javascript">
         var table;
        
       var discountValidator = {
        validators: {
            notEmpty: {
                message: 'The Discount is required'
            },
            stringLength: {
                max: 20,
                message: 'The Discount must be less than 20 characters long'
            },
            regexp: {
                regexp: /^((\d+)((\.\d{0,2})?))$/,
                message: 'invalid'
            }
        }
    };
         var BootstrapSwitch = {
                 init: function () {
                     $("[data-switch=true]").bootstrapSwitch()
                 }
             };
         var DatatablesDataSourceHtml = {
        	        init: function () {
        	            table = $("#coupon_table").DataTable({
        	                searchDelay: 100,
        	                processing: !0,
        	                scrollX: true,
        	                serverSide: true,
        	                //fixedColumns: true,
        	                ajax: {
        	                    url: "<%=request.getContextPath()%>/coupon/customdatatable",
        	                    type: "POST",
        	                },
        	                columns: [{
        	                    data: "couponId"
        	                }, {
        	                    data: "couponType"
        	                }, {
        	                    data: "points"
        	                }, {
        	                    data: "couponId"
        	                }, ],

        	                columnDefs: [
        	                	{
        	                        targets: 0,
        	                        searchable: false,
        	                        orderable: !1,
        	                        render: function (a, e, t, n) {

        	                            //return (n.row + 1);
        	                            return n.row + n.settings._iDisplayStart + 1;
        	                        }
        	                    },{
        	                        targets: 3,
        	                        searchable: false,
        	                        orderable: !1,
        	                        render: function (a, e, t, n) {
										return '<a data-toggle="modal" data-id="' + a + '" onClick="updatecoupon(' + t.couponId + ')" data-target="#coupon_edit_modal" class="m-portlet__nav-link btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill" id="demo" title="Edit"> <i class="fa fa-edit"></i></a> <a onclick="deleteCoupon(' + t.couponId + ')" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete"> <i class="fa fa-trash"></i></a>';
        	                        }
        	                    }],

        	                //lengthMenu: [[10,25,50,100,-1], [10,25,50,100,"All"]],
        	                fixedHeader: {
        	                    header: false,
        	                    footer: false
        	                },
        	                
        	            })
        	        }
        	    };
        	     var minmax = function (value, min, max) {
        var discountType = $("#discount_type_new_model").val();
        if (discountType == "percentage") {
            if (parseInt(value) < 0 || isNaN(value))
                return 0;
            else if (parseInt(value) > 100) {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.error("Discount cannot be greater than 100%.");
                return 100;
            }
        }
        return value;
    }
       var minmaxedit = function (value, min, max) {
        var discountType = $("#discount_type_edit_model").val();
        if (discountType == "percentage") {
            if (parseInt(value) < 0 || isNaN(value))
                return 0;
            else if (parseInt(value) > 100) {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                toastr.error("Discount cannot be greater than 100%.");
                return 100;
            }
        }
        return value;
    }
         $(document).ready(function () {
         
             DatatablesDataSourceHtml.init();
             BootstrapSwitch.init();
             $('#typeswitch').on('switchChange.bootstrapSwitch', function (e, state) {
				if (state) {
                    $("#coupon_type_new_model").val("Discount")
                 	$("#discount_div_new").removeClass("m--hide");
                 	$('#coupon_new_form').formValidation('addField', "discount_new_model", discountValidator);
                 } else {
                    $("#coupon_type_new_model").val("Free Product")
                    $("#discount_div_new").addClass("m--hide"); 
                    $('#coupon_new_form').formValidation('removeField', "discount_new_model");
                 }
             });
              $('#edittypeswitch').on('switchChange.bootstrapSwitch', function (e, state) {
				if (state) {
                    $("#coupon_type_edit_model").val("Discount")
                 	$("#discount_div_edit").removeClass("m--hide");
                 	$('#coupon_edit_form').formValidation('addField', "discount_edit_model", discountValidator);
                 } else {
                    $("#coupon_type_edit_model").val("Free Product")
                    $("#discount_div_edit").addClass("m--hide"); 
                    $('#coupon_edit_form').formValidation('removeField', "discount_edit_model");
                 }
             });

            $('#switchotpverify').on('switchChange.bootstrapSwitch', function (e, state) {
               if (state) {
                  $("#otpverify").val(1)
               } else {
                  $("#otpverify").val(0)
               }
            });

            $('#sweditotpverify').on('switchChange.bootstrapSwitch', function (e, state) {
               if (state) {
                  $("#editotpverify").val(1)
               } else {
                  $("#editotpverify").val(0)
               }
            });

         });
         
         function deleteCoupon(id) {
         
             swal({
                 title: "Are you sure?",
                 text: "You won't be able to revert this!",
                 type: "warning",
                 showCancelButton: !0,
                 confirmButtonText: "Yes, delete it!"
             }).then(function (e) {
         
                 if (e.value) {
                     $.post("/coupon/delete", {
                         id: id
                     }, function (data, status) {
                         toastr["success"]("Record Deleted....");
                         location.reload(true);
                     });
                 }
             })
         
         }
    function btnpercentage() {
        $('#btn_percentage_new_model').slideUp();
        $('#btn_amount_new_model').slideDown();
        $('#discount_type_new_model').val("amount")
      
    }

    function btnamount() {
		$('#btn_percentage_new_model').slideDown();
        $('#btn_amount_new_model').slideUp();
        $('#discount_type_new_model').val("percentage")
    }
    function btnpercentageEdit() {
     	$('#btn_percentage_edit_model').show();
        $('#btn_amount_edit_model').hide();
        $('#discount_type_edit_model').val("percentage")
      
    }

    function btnamountEdit() {
    	$('#btn_percentage_edit_model').hide();
        $('#btn_amount_edit_model').show();
        $('#discount_type_edit_model').val("amount")
    }
    function check(e, c) {
    	var notallow=['!','@','#','$','%','^','&','*','(',')','_','+','~','`','/','*','-','+'];
        var allowedKeyCodesArr = [9, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 8, 37, 39, 109, 189, 46, 110, 190];  // allowed
		
        if ($.inArray(e.key, notallow) != -1) { 
        	  e.preventDefault();																																				
        }  else if ($.inArray(e.keyCode, allowedKeyCodesArr) === -1) {  
            e.preventDefault();
        } else if ($.trim($(c).val()).indexOf('.') > -1 && $.inArray(e.keyCode, [110, 190]) !== -1) {  
            e.preventDefault();
        } else {
            return true;
        }
    }
         function updatecoupon(id) {
             $.get("/coupon/" + id, function (data) {
             $("#coupon_id").val(data.couponId)
         		$("#coupon_type_old_model").val(data.couponType);

	         		if(data.couponType=='Discount'){
	         		  	$('#edittypeswitch').prop('checked', true).change(); 
	         		   	$("#coupon_type_edit_model").val("Discount")
                 		$("#discount_div_edit").removeClass("m--hide");
                 		$('#coupon_edit_form').formValidation('addField', "discount_edit_model", discountValidator);
	         		}else{
	         		   	$('#edittypeswitch').prop('checked', false).change(); 
	         		    $("#coupon_type_edit_model").val("Free Product")
                    	$("#discount_div_edit").addClass("m--hide"); 
                    	$('#coupon_edit_form').formValidation('removeField', "discount_edit_model");
	         		}

                if(data.otpverify==1){
                   $('#sweditotpverify').prop('checked', true).change();
                   $("#editotpverify").val(1)
                }else{
                   $('#sweditotpverify').prop('checked', false).change();
                   $("#editotpverify").val(0)
                }

                $("#points_edit_model").val(data.points);
	         		$("#description_edit_model").val(data.description);
	         		$("#discount_type_edit_model").val(data.discountType);
	         		
	         		if(data.discountType=='amount'){
	         			btnamountEdit();
	         		}else{
	         			btnpercentageEdit();
	         		}
	         		$("#discount_edit_model").val(data.discount);
         		       
             });
         }
         
         
      </script>
   </body>
   <!-- end::Body -->
</html>