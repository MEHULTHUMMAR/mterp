<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="uvfn" %>

<meta name="viewport22" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
<!--begin::Web font -->
<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
<script>
    WebFont.load({
        google: {
            "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"]
        }, active: function () {
            sessionStorage.fonts = true;
        }
    });
</script>
<!--end::Web font -->

<!--begin::Base Styles -->
<link href="<%=request.getContextPath()%>/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/assets/demo/demo12/base/style.bundle.css" rel="stylesheet" type="text/css"/>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
      rel="stylesheet">
<!--end::Base Styles -->
<style type="text/css">
    .select2-container {
        display: block;
    }

    .m-form.m-form--state .has-success .input-group .input-group-text,
    .m-form.m-form--state .has-success .input-group .btn.btn-secondary,
    .m-form.m-form--state .has-success .form-control:focus,
    .m-form.m-form--state .has-success .form-control {
        border-color: #36a3f7;
    }

    .form-control.focus, .form-control:focus {
        border-color: #36a3f7;
        webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
    }

    .form-control.hover, .form-control:hover {
        webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        border-color: #36a3f7;
    }

    .form-control.focus, .form-control:focus {
        border-color: #36a3f7;
        webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
    }

    .form-control.hover, .form-control:hover {
        webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.3);
        border-color: #36a3f7;
    }

    .m-form .form-control-label, .m-form .col-form-label, .m-form .m-form__group > label {
        font-weight: 800;
        color: #222;
        font-size: 13px;
        font-family: "Gotham SSm", Helvetica, Arial, sans-serif;
    }

    .select2 {
        -webkit-box-shadow: 0 1px 6px rgba(57, 73, 76, .35);
        box-shadow: 0 1px 6px rgba(57, 73, 76, .35);
    }

    .select2:hover {
        webkit-box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
        box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
    }

    .select2:focus {
        webkit-box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
        box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
    }

    .select2-container--default.select2-container--focus .select2-selection--multiple,
    .select2-container--default.select2-container--focus .select2-selection--single,
    .select2-container--default.select2-container--open .select2-selection--multiple,
    .select2-container--default.select2-container--open .select2-selection--single {
        border-color: #36a3f7 !important
    }

    .m-widget28 .m-widget28__container .m-widget28__tab .m-widget28__tab-container .m-widget28__tab-items .m-widget28__tab-item > span:first-child {
        color: #222;
    }

    .m-widget28 .m-widget28__container .m-widget28__tab .m-widget28__tab-container .m-widget28__tab-items .m-widget28__tab-item > span:first-child {
        font-size: .85rem;
        font-weight: 800
    }

    .m-tabs-line.m-tabs-line--primary.nav.nav-tabs .nav-link:hover,
    .m-tabs-line.m-tabs-line--primary.nav.nav-tabs .nav-link.active,
    .m-tabs-line.m-tabs-line--primary a.m-tabs__link:hover,
    .m-tabs-line.m-tabs-line--primary a.m-tabs__link.active {
        color: #36a3f7;
        border-bottom: 1px solid #36a3f7;
    }

    .m-portlet .m-portlet__body {
        color: #222;
    }

    .table th {
        font-weight: 800
    }

    .m-tabs-line.nav.nav-tabs .nav-link,
    .m-tabs-line a.m-tabs__link {
        background: transparent;
        color: #222;
    }

    .nav.nav-pills .nav-link,
    .nav.nav-tabs .nav-link {
        font-weight: 800;
    }

    .col-form-label {
        font-weight: 800;
    }

    .dataTables_wrapper div.dataTables_filter label {
        font-weight: 800 !important;
    }

    .m-section .m-section__heading {
        font-weight: 800
    }

    .m--font-bolder {
        font-weight: 800
    }

    .m-form .form-control-label,
    .m-form label {
        font-weight: 800;
    }

    .form-control-label {
        font-weight: 800
    }

    .modal .modal-content .modal-header .modal-title {
        font-weight: 800;
    }

    .bootstrap-select.show > .dropdown-toggle.btn-light,
    .bootstrap-select.show > .dropdown-toggle.btn-secondary {
        border-color: #36a3f7 !important;
    }

    .bootstrap-select {
        -webkit-box-shadow: 0 1px 6px rgba(57, 73, 76, .35);
        box-shadow: 0 1px 6px rgba(57, 73, 76, .35);
    }

    .bootstrap-select:hover {
        webkit-box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
        box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
    }

    .bootstrap-select:focus {
        webkit-box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
        box-shadow: 0 2px 10px 1px rgba(57, 73, 76, .4), 0 1px 2px rgba(57, 73, 76, .25);
    }
</style>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/image/mterplogo.jpg"/>