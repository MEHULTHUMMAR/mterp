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
                        <h3 class="m-subheader__title m-subheader__title--separator">Bill Of Material
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
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="bom_form" action="<%=request.getContextPath() %>/bom/save" method="post">

                <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet">
                                <div class="m-portlet__body card-body-sm">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <input type="hidden" id="drawingLogicId" name="drawingLogicDocVo.drawingLogicDocId" value="${drawingLogicId}">
                                                        <input type="hidden" id="planingItemId" name="planingItemId" value="${planingItemId}">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Bill of Material No.</label>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <input type="text" class="form-control form-control-sm"
                                                                   name="prefix" id="prefix" readonly value="${prefix}"
                                                                   placeholder="prefix"/>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                                            <input type="text" class="form-control form-control-sm"
                                                                   name="bomNo" id="bomNo" placeholder="BOM No" value="${bomNo}"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-3 col-sm-4">
                                                    <div class="form-group row p-0">
                                                        <label class="col-lg-12 col-md-12 col-sm-12">Select Material
                                                            Type <span style="font-size:1.25rem;"
                                                                       class="text-danger">*</span></label>
                                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="materialType"
                                                                        name="materialTypeVo.materialTypeId"
                                                                        placeholder="Select Material Type">

                                                                    <option value="0">Select material Type</option>
                                                                    <c:forEach items="${materilTypeList}" var="materilTypeList">
                                                                        <option value="${materilTypeList.material_type_id}"> ${materilTypeList.material_type} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4">
                                                    <label class="col-lg-12 col-md-12 col-sm-12">Size of Material <span
                                                            style="font-size:1.25rem;"
                                                            class="text-danger">*</span></label>
                                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" autofocus name="sizeOfMaterial"
                                                                   id="materialround" value="round" checked> Round
                                                            <span></span>
                                                        </label>
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" name="sizeOfMaterial"
                                                                   id="materialSquare" value="squre"> Square
                                                            <span></span>
                                                        </label>
                                                        <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                            <input type="radio" name="sizeOfMaterial" id="materialflat"
                                                                   value="flat"> flat
                                                            <span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-2 col-md-2 col-sm-6">
                                                    <input type="text" class="form-control form-control-sm"
                                                           name="materialCost" id="materialCost" onchange="setAllTotal()" value="0"
                                                           placeholder="Material Cost"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="round_div">
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
                                                        <input type="radio" autofocus name="roundType"
                                                               id="roundTypeSolid" value="solid" checked> Solid
                                                        <span></span>
                                                    </label>
                                                    <label class="m-radio m-radio--solid m-radio--brand m-widget4__title">
                                                        <input type="radio" name="roundType"
                                                               id="roundTypePipe" value="pipe"> Pipe
                                                        <span></span>
                                                    </label>

                                                </div>
                                            </div>

                                            <div class="row" id="solid-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Diameter No. <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="diameterNo" id="diameterNo" value="0"
                                                                   placeholder="Diameter No."/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="diameterNoUOM"
                                                                        name="diameterNoUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Length <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="diameterLength" id="diameterLength" value="0"
                                                                   placeholder="Length"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="diameterLengthUOM"
                                                                        name="diameterLengthUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" id="pipe-portlet">
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Length <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="pipeLength" id="pipeLength" value="0"
                                                                   placeholder="Pipe"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="pipeLengthUOM"
                                                                        name="pipeLengthUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">OD <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="odValue" id="odValue" value="0"
                                                                   placeholder="OD"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="odUOM"
                                                                        name="odUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
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


                    <div class="row" id="squre_div">
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
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="squreVal1" id="squreVal1" value="0"
                                                                   placeholder="squreVal1"/>
                                                        </div>
                                                        <label class="col-lg-1 col-md-1 col-sm-2">X </label>
                                                        <div class="col-lg-2 col-md-2 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="squreVal2" id="squreVal2" value="0"
                                                                   placeholder="squreVal2"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="squreUOM"
                                                                        name="squreUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Length <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="squreLength" id="squreLength" value="0"
                                                                   placeholder="Length"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="squreLengthUOM"
                                                                        name="squreLengthUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
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


                    <div class="row" id="flat_div">
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
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Small </label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="small" id="small" value="0"
                                                                   placeholder="small"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="smallUOM"
                                                                        name="smallUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Big </label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="big" id="big" value="0"
                                                                   placeholder="big"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="bigUOM"
                                                                        name="bigUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Length <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"
                                                                   name="flatLength" id="flatLength" value="0"
                                                                   placeholder="Length"/>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <div class="input-group">
                                                                <select class="form-control form-control-sm m-100px"
                                                                        id="flatLengthUOM"
                                                                        name="flatLengthUOM"
                                                                        placeholder="Select UOM">

                                                                    <option value="0">Select UOM</option>
                                                                    <c:forEach items="${uomList}" var="uomList">
                                                                        <option value="${uomList.uom_name}"> ${uomList.uom_name} </option>
                                                                    </c:forEach>
                                                                </select>
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


                    <div class="row" id="_total_">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="m-portlet m-portlet--tabs m-portlet--head-solid-bg m-portlet--head-sm">

                                <div class="m-portlet__body card-body-sm">
                                    <div class="tab-content">
                                        <div class="tab-pane active"  role="tabpanel">
                                            <div class="row" >
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Machine Cost</label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" value="0"
                                                                   name="machineCost" id="machineCost" onchange="setAllTotal()"
                                                                   placeholder="Machine Cost"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Labour Cost</label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" value="0"
                                                                   name="labourCost" id="labourCost" onchange="setAllTotal()"
                                                                   placeholder="Labour Cost"/>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Additional Cost  <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" value="0"
                                                                   name="additionalCost" id="additionalCost" onchange="setAllTotal()"
                                                                   placeholder="Additional Cost"/>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Total <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm"value="0"
                                                                   name="total" id="total" readonly
                                                                   placeholder="Total"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">Profit <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" value="0"
                                                                   name="profit" id="profit" onchange="setAllTotal()"
                                                                   placeholder="Profit"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12 col-sm-12">
                                                    <div class="row">
                                                        <label class="col-lg-2 col-md-2 col-sm-2">BOM Total <span
                                                                style="font-size:1.25rem;"
                                                                class="text-danger">*</span></label>
                                                        <div class="col-lg-3 col-md-3 col-sm-3">
                                                            <input type="number" class="form-control form-control-sm" value="0"
                                                                   name="bomTotal" id="bomTotal" readonly
                                                                   placeholder="BOM Total"/>
                                                        </div>
                                                    </div>
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
                                                <button type="submit" class="btn btn-info" id="save_sales"
                                                        style="border-radius: .25rem" >Save
                                                </button>

                                            </div>
                                        </div>
                                    </footer>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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

        $("#squre_div").hide();
        $("#flat_div").hide();
        $("#pipe-portlet").hide();

        $("input[name=sizeOfMaterial]").change(function () {

            $("#diameterNo").val(0);
            $("#diameterLength").val(0);
            $("#pipeLength").val(0);
            $("#odValue").val(0);
            $("#squreVal1").val(0);
            $("#squreVal2").val(0);
            $("#squreLength").val(0);
            $("#small").val(0);
            $("#big").val(0);
            $("#flatLength").val(0);

            if ($("#materialround").prop('checked')) {
                $("#round_div").show();
                $("#squre_div").hide();
                $("#flat_div").hide();

                $("#roundTypeSolid").prop('checked', true);
                $("#solid-portlet").show();
                $("#pipe-portlet").hide();
            } else if ($("#materialSquare").prop('checked')) {
                $("#round_div").hide();
                $("#squre_div").show();
                $("#flat_div").hide();
            }else {
                $("#round_div").hide();
                $("#squre_div").hide();
                $("#flat_div").show();
            }
        });

        $("input[name=roundType]").change(function () {

            if ($("#roundTypeSolid").prop('checked')) {
                $("#solid-portlet").show();
                $("#pipe-portlet").hide();
            } else {
                $("#solid-portlet").hide();
                $("#pipe-portlet").show();
            }
        });


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