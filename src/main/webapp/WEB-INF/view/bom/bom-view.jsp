<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <%@include file="../header/head.jsp" %>

    <title>${bomVo.prefix}${bomVo.bomNo}</title>
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
                        <h3 class="m-subheader__title m-subheader__title--separator">Bill Of Material | ${bomVo.prefix}${bomVo.bomNo}
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

                <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet">
                                <div class="m-portlet__body card-body-sm">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <input type="hidden" id="drawingLogicId" name="drawingLogicDocVo.drawingLogicDocId" value="${bomVo.drawingLogicDocVo.drawingLogicDocId}">
                                                        <input type="hidden" id="planingItemId" name="planingItemId" value="${bomVo.planingItemId}">
                                                        <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Bill of Material No.</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                           <span>${bomVo.prefix}${bomVo.bomNo}</span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Select Material
                                                            Type <span style="font-size:1.25rem;"
                                                                       class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <span>${bomVo.materialTypeVo.materialType}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Size of Material</label>
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" autofocus name="sizeOfMaterial" disabled
                                                                   id="materialround" value="round" <c:if test="${bomVo.sizeOfMaterial=='round'}">checked</c:if> > Round
                                                            <span></span>
                                                        </label>
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" name="sizeOfMaterial" disabled
                                                                   id="materialSquare" value="squre" <c:if test="${bomVo.sizeOfMaterial=='squre'}">checked</c:if>> Square
                                                            <span></span>
                                                        </label>
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" name="sizeOfMaterial" id="materialflat" disabled
                                                                   value="flat" <c:if test="${bomVo.sizeOfMaterial=='flat'}">checked</c:if>> flat
                                                            <span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-2 col-md-2 col-sm-6">
                                                    <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Material Cost</label>
                                                    <label class="col-lg-12 col-md-12 col-sm-12">${bomVo.materialCost}</label>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Bill of Material Date :</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <span>${bomVo.bomDate}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <label class="col-lg-12 col-md-12 col-sm-12" style="font-weight: 500;">Drawing Logic No. :</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <span>${bomVo.drawingLogicDocVo.prefix}${bomVo.drawingLogicDocVo.drawingLogicDocNo}</span>
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

                <div class="row <c:if test="${bomVo.sizeOfMaterial!='round'}"> m--hide </c:if>" id="round_div" >
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
                                                        href="#m_tabs_7_1" role="tab" tabindex="-1"> Round </a></li>

                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="m_tabs_7_1" role="tabpanel">
                                            <div class="row" id="productdetails-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                        <input type="radio" autofocus name="roundType" disabled
                                                               id="roundTypeSolid" value="solid" <c:if test="${bomVo.roundType=='solid'}"> checked </c:if>> Solid
                                                        <span></span>
                                                    </label>
                                                    <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                        <input type="radio" name="roundType" disabled <c:if test="${bomVo.roundType=='pipe'}"> checked </c:if>
                                                               id="roundTypePipe" value="pipe"> Pipe
                                                        <span></span>
                                                    </label>

                                                </div>
                                            </div>

                                            <div class="row <c:if test="${bomVo.roundType!='solid'}"> m--hide </c:if>"   id="solid-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Diameter No. :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.diameterNo}  ${bomVo.diameterNoUOM}</label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Length :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.diameterLength}  ${bomVo.diameterLengthUOM}</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row <c:if test="${bomVo.roundType!='pipe'}"> m--hide </c:if>" id="pipe-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Length :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.pipeLength}  ${bomVo.pipeLengthUOM}</label>


                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">OD: </label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.odValue}  ${bomVo.odUOM}</label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row <c:if test="${bomVo.sizeOfMaterial!='squre'}"> m--hide </c:if>" id="squre_div">
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
                                                        href="#m_tabs_7_1" role="tab" tabindex="-1"> Squre </a></li>

                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="" role="tabpanel">
                                            <div class="row" id="">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.squreVal1} X ${bomVo.squreVal2}   ${bomVo.squreUOM}</label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Length :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.squreLength}  ${bomVo.squreLengthUOM}</label>

                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row <c:if test="${bomVo.sizeOfMaterial!='flat'}"> m--hide </c:if>" id="flat_div">
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
                                                        href="#m_tabs_7_1" role="tab" tabindex="-1"> Flat </a></li>

                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="" role="tabpanel">
                                            <div class="row" id="">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Small :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.small}  ${bomVo.smallUOM}</label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Big </label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.big} ${bomVo.bigUOM}</label>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Length :</label>
                                                        <label class="col-lg-2 col-md-2 col-sm-2">${bomVo.flatLength}  ${bomVo.flatLengthUOM}</label>
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row" id="_total_">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet m-portlet--tabs m-portlet--head-solid-bg m-portlet--head-sm">

                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active"  role="tabpanel">
                                            <div class="row" >
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Machine Cost :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" readonly style="text-align: right;"
                                                                   name="machineCost" id="machineCost" onchange="setAllTotal()" value="${bomVo.machineCost}"
                                                                   placeholder="Machine Cost"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Labour Cost :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"  readonly style="text-align: right; "
                                                                   name="labourCost" id="labourCost" onchange="setAllTotal()" value="${bomVo.labourCost}"
                                                                   placeholder="Labour Cost"/>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Additional Cost  :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"  readonly style="text-align: right;"
                                                                   name="additionalCost" id="additionalCost" onchange="setAllTotal()" value="${bomVo.additionalCost}"
                                                                   placeholder="Additional Cost"/>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Total :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" style="text-align: right;"
                                                                   name="total" id="total" readonly value="${bomVo.total}"
                                                                   placeholder="Total"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">Profit :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" style="text-align: right;"
                                                                   name="profit" id="profit" onchange="setAllTotal()" readonly value="${bomVo.profit}"
                                                                   placeholder="Profit"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2" style="font-weight: 500;">BOM Total :</label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" style="text-align: right;"
                                                                   name="bomTotal" id="bomTotal" readonly value="${bomVo.bomTotal}"
                                                                   placeholder="BOM Total"/>
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
        $("#materialType").select2();
        $("#diameterNoUOM").select2();
        $("#diameterLengthUOM").select2();
        $("#pipeLengthUOM").select2();
        $("#odUOM").select2();
        $("#squreUOM").select2();
        $("#squreLengthUOM").select2();
        $("#smallUOM").select2();
        $("#bigUOM").select2();
        $("#flatLengthUOM").select2();


        $("#enquireDate").datepicker({
            dateFormat: 'DD/MM/YYYY',
            autoApply:true,
            orientation: "auto bottom",
            setDate:'today'
        });


        $("#save_sales").click(function (e) {
            // $('#sales_form').formValidation('revalidateField', "salesNo");
            $('#save_sales').prop('disabled', true);

                // if ($('#sales_form').data('formValidation').isValid() == null) {
                //     $('#sales_form').data('formValidation').validate();
                // }
            document.getElementById("bom_form").submit();
        });
        //----------Department------------
        $("#product_new_form1").formValidation({
            framework: 'bootstrap',
            live: 'disabled',
            excluded: ":disabled",
            button: {
                selector: "#saveproduct1",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                productName: {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'The  Product Name is required.'
                        }
                    }
                },itemcode: {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'The itemcode is required. '
                        }
                    }
                },categoryId: {
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: 'The Category is required. '
                        }
                    }
                }

            }
        }).on('success.form.fv', function (e) {
            e.preventDefault();//stop the from action methods
            const form = $("#product_new_form");

            var filenames="",ids="";
            $("#all_prodcut_tbl").find("[data-purchase-item='template']").remove();
            var $purchaseItem = $("#all_prodcut_tbl").find("[data-purchase-item]").not(".m--hide");
            $purchaseItem.each(function() {
                var index=this.id;
                ids+=index+",";
                filenames+=$("#fileName"+index).val()+",";
            })
            $("#fileNames").val(filenames);
            $("#ids").val(ids);
            $("#saveproduct").attr("disabled", true);
            var formData = form.serializeArray();
            var fileInput = document.getElementById('uploadFiles');
            formData.append('uploadFiles', fileInput);

            $.ajax({
                url: "/product/saveproduct",
                type: "POST",
                data: formData,
                success: function(blob, status, xhr) {
                    // check for a filename
                    toastr["success"]("Record Inserted....");
                    $('#contact_new_modal').modal('toggle');
                    table.ajax.reload();
                },
            });
        });
   $("#saveproduct").click(function () {
            //  $('#product_new_form').data('formValidation').validate();


            var filenames="",ids="";
            $("#all_prodcut_tbl").find("[data-purchase-item='template']").remove();
            var $purchaseItem = $("#all_prodcut_tbl").find("[data-purchase-item]").not(".m--hide");
            $purchaseItem.each(function() {
                var index=this.id;
                ids+=index+",";
                filenames+=$("#fileName"+index).val()+",";
            })
            $("#fileNames").val(filenames);
            $("#ids").val(ids);

        });

        //----------End Department------------
    });

    function setAllTotal(){
        var materialCost = $("#materialCost").val();
        var machineCost = $("#machineCost").val();
        var labourCost = $("#labourCost").val();
        var additionalCost = $("#additionalCost").val();
        var profit = $("#profit").val();
        var total=0, bomTotal=0;

        if(!materialCost){materialCost=0;}
        if(!machineCost){machineCost=0;}
        if(!labourCost){labourCost=0;}
        if(!additionalCost){additionalCost=0;}
        if(!profit){profit=0;}

        total= parseFloat(materialCost)+parseFloat(machineCost)+parseFloat(labourCost)+parseFloat(additionalCost);
        $("#total").val(total.toFixed(2));

        total = parseFloat(total) + parseFloat(((total*profit)/100));
        $("#bomTotal").val(total.toFixed(2));


    }
</script>
</body>

<!-- end::Body -->
</html>