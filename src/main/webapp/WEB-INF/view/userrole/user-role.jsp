<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>User Role</title>
    <link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet"
          type="text/css"/>
</head>
<!-- begin::Body -->
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
<!-- begin:: Page -->
<div class="m-grid m-grid--hor m-grid--root m-page">
    <!-- Include Header -->
    <%@include file="../header/header.jsp" %>

    <!-- begin::Body -->
    <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">

        <!-- Include Navigation -->
        <%@include file="../header/navigation.jsp" %>

        <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <!-- BEGIN: Subheader -->
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title m-subheader__title--separator">User Role</h3>

                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="<%=request.getContextPath() %>/dashboard"
                                   class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <!-- END: Subheader -->

            <div class="m-content">

                <div class="row">

                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <!--begin::Portlet-->
                        <div class="m-portlet m-portlet--bordered-semi">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <c:if test="${isInsert == 1}">
                                        <div class="m-portlet__head-title">
                                            <a href="/userrole/new"
                                               class="btn btn-primary btn-sm m-btn m-btn--icon m-btn--air">
                                                <span><i class="la la-plus"></i><span>New User Role</span></span>
                                            </a>
                                        </div>
                                    </c:if>
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
                                            <option value="500">500</option>
                                            <option value="-1">All</option>
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
                            <div class="m-portlet__body">
                                <div class="m_datatable">
                                    <table class="table table-striped- table-bordered table-hover table-checkable"
                                           id="userrole_table">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Role Name</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="userRoleVo" items="${userRoleVos}" varStatus="index">
                                            <tr>
                                                <td>${index.index+1}</td>
                                                <td>
                                                    <a
                                                            href="${pageContext.request.contextPath}/userrole/${userRoleVo.userRoleId}"
                                                            class="m-link m--font-bolder">${userRoleVo.userRoleName}</a>
                                                </td>
                                                <td>
                                                    <c:if test="${isEdit == 1}">
                                                        <a href="userrole/${userRoleVo.userRoleId}/edit"
                                                           class="m-portlet__nav-link btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill"
                                                           title="Edit"> <i class="fa fa-edit"></i></a>
                                                    </c:if>
                                                        <%-- <a href="JavaScript:void(0)" data-url="/userrole/${userRoleVo.userRoleId}/delete" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill"
                                                            title="Delete"> <i class="fa fa-trash"></i></a> --%>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--end::Portlet-->
                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- end:: Body -->

    <!-- Include Footer -->
    <%@include file="../footer/footer.jsp" %>

</div>
<!-- end:: Page -->

<!--begin::Base Scripts -->
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<!--end::Base Scripts -->

<script src="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.js"
        type="text/javascript"></script>
<%@include file="../global/global-script.jsp" %>

<script type="text/javascript">
    var table;
    var DatatablesDataSourceHtml = {
        init: function () {
            table = $("#userrole_table").DataTable({
                responsive: !0,

            })
        }
    };

    $(document).ready(function () {
        DatatablesDataSourceHtml.init();
    });

</script>
</body>
<!-- end::Body -->
</html>