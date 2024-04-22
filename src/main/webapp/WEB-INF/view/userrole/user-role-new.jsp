<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>New User Role</title>
    <link href="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%=request.getContextPath()%>/assets/vendors/custom/datatables/datatables.bundle.css" rel="stylesheet"
          type="text/css"/>
</head>
<!-- begin::Body -->
<body data-submit="#saveuserrole" data-cancel="#cancel_user_role"
      class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
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
                        <h3 class="m-subheader__title m-subheader__title--separator">New User Role</h3>

                        <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                            <li class="m-nav__item m-nav__item--home">
                                <a href="<%=request.getContextPath() %>/dashboard"
                                   class="m-nav__link m-nav__link--icon">
                                    <i class="m-nav__link-icon la la-home"></i>
                                </a>
                            </li>

                            <li class="m-nav__separator">-</li>
                            <li class="m-nav__item">
                                <a href="<%=request.getContextPath()%>/userrole" class="m-nav__link">
                                    <span class="m-nav__link-text">User Role</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- END: Subheader -->

            <div class="m-content">
                <form class="m-form m-form--state m-form--fit m-form--label-align-left" id="userrole_new_form"
                      action="/userrole/save" method="post">

                    <!--begin::Portlet-->
                    <div class="m-portlet">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
										<span class="m-portlet__head-icon">
											<i class="flaticon-cogwheel-2"></i>
										</span>
                                    <h3 class="m-portlet__head-text m--font-brand">User Role</h3>
                                </div>
                            </div>
                        </div>
                        <div class="m-portlet__body">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 mb-5">
                                    <div class="" role="alert">
                                        <strong id="product_name">User Role Name: </strong>
                                        <input type="text" autofocus class="form-control m-input" name="userRoleName"
                                               id="userRoleName" placeholder="User Role Name">
                                    </div>
                                </div>
                            </div>
                            <c:forEach items="${navMenuPermission}" var="navMenuPermission">
                                <c:set var="NavSubMenu"
                                       value="${navSubMenuPermission.stream().filter( ppp -> ppp.navMenuVo.navMenuId==navMenuPermission.navMenuId).toList()}"/>

                                <div class="row mt-4">
                                    <div class="col-md-12 ">
                                        <div class="alert m-alert--default mb-0" role="alert">
                                            <strong id="product_name">${navMenuPermission.title}: </strong>
                                        </div>
                                    </div>
                                    <c:forEach items="${NavSubMenu}" var="NavSubMenu">
                                        <c:set var="dateParts" value=""/>
                                        <div class="col-md-3 ">
                                            <div class="form-group m-form__group row">
                                                <label for="example-text-input" class="col-12 col-form-label">
                                                        ${NavSubMenu.title}
                                                </label>
                                                <div class="col-12">
                                                    <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand">
                                                        <input type="checkbox" onclick="selctAllCheckBox(this)"
                                                               id="${NavSubMenu.type}"> Select All <span></span>
                                                    </label>
                                                    <br>
                                                    <c:forEach items="${navMenuAction}" var="navMenuAction">
                                                        <c:if test="${fn:contains(NavSubMenu.subMenuAction,navMenuAction.navMenuActionId)}">
                                                            <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand">
                                                                <input type="checkbox"
                                                                       class="${NavSubMenu.type} checkbox"
                                                                       id="${navMenuAction.actionName}-${NavSubMenu.type}"
                                                                       name="${navMenuAction.actionName}-${NavSubMenu.type}">
                                                                    ${navMenuAction.actionName}
                                                                <span></span>
                                                            </label>
                                                            <br>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:forEach>

                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions m-form__actions--solid m-form__actions--right">
                                <button type="submit" class="btn btn-brand" id="saveuserrole">
                                    Submit
                                </button>

                                <a href="/userrole" id="cancel_user_role" class="btn btn-secondary">
                                    Cancel
                                </a>
                            </div>
                        </div>
                    </div>
                    <!--end::Portlet-->
                </form>
            </div>

        </div>

    </div>
    <!-- end:: Body -->

    <!-- Include Footer -->
    <%@include file="../footer/footer.jsp" %>
    <%@include file="../global/location-ajax.jsp" %>
</div>
<!-- end:: Page -->

<!--begin::Base Scripts -->
<script src="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/base/scripts.bundle.js" type="text/javascript"></script>
<!--end::Base Scripts -->

<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/bootstrap-datepicker.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/demo/demo12/custom/crud/forms/widgets/select2.js"
        type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/formValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/vendors/formvalidation/framework/bootstrap.min.js"></script>

<script src="<%=request.getContextPath()%>/script/userrole/userrole-script.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function () {

    });

    function selctAllCheckBox(e) {

        if ($('#' + $(e).attr("id")).not(':checked').length) {
            $("." + $(e).attr("id")).prop('checked', false);
        } else {
            $("." + $(e).attr("id")).prop("checked", true);
        }

    }
</script>
</body>
<!-- end::Body -->
</html>