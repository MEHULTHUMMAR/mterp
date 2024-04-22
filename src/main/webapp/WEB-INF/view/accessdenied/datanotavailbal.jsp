<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%@include file="../header/head.jsp" %>

    <title>Data Not Available</title>

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

            <div class="m-content">

                <div class="row">
                    <div class="col-md-12 m-page-500" style="    margin-top: 100px;     text-align: center;">
                        <div class=" number font-red"
                             style="letter-spacing: -10px; line-height: 128px; font-size: 100px; font-weight: 100;    display: inline-block;color: #ec8c8c; text-align: right; color: #e7505a!important;">
                            Data Not Available
                        </div>
                        <div class=" details">
                            <h3></h3>
                            <br>
                        </div>

                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <!--begin::Portlet-->

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
<script src="<%=request.getContextPath()%>/assets/datatable/jquery.spring-friendly.js" type="text/javascript"></script>

<script type="text/javascript">
    var DatatablesDataSourceHtml = {
        init: function () {
            $("#m_table_1").DataTable({
                responsive: !0,
                pageLength: 10,
                searchDelay: 500,
                processing: !0,
                serverSide: true,
                ajax: {
                    url: "<%=request.getContextPath()%>/product/datatable",
                    type: "POST",
                    "data": function (d) {
                        return $.extend({}, d, {
                            "category": $('#categoryVo').val(),
                            "brand": $('#brandVo').val()

                        });
                    }
                },
                lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
                columns: [{
                    data: "productId"
                }, {
                    data: "categoryVo.categoryName"
                }, {
                    data: "brandVo.brandName"
                }, {
                    data: "name"
                }, {
                    data: "hsnCode"
                }, {
                    data: "salesTaxVo.taxRate"
                }, {
                    data: "purchaseTaxVo.taxRate"
                }, {
                    data: "productId",
                }],

                columnDefs: [{
                    targets: 7,
                    title: "Actions",
                    orderable: !1,
                    render: function (a, e, t, n) {
                        return '\n  <span class="dropdown">\n<a href="' + e + '" class="btn m-btn m-btn--hover-brand m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="dropdown" aria-expanded="true">\n<i class="la la-ellipsis-h"></i>\n </a>\n<div class="dropdown-menu dropdown-menu-right">\n<a class="dropdown-item" href="/product/' + t.productId + '/edit"><i class="la la-edit"></i> Edit Details</a>\n</div>\n</span>\n '
                    }

                }, {
                    targets: 0,
                    orderable: !1,
                    render: function (a, e, t, n) {

                        //return (n.row + 1);
                        return n.row + n.settings._iDisplayStart + 1;
                    }
                }, {
                    targets: 3,
                    title: "Product Name",
                    orderable: !1,
                    render: function (a, e, t, n) {

                        return '\n  <a href="/product/' + t.productId + '" class="m-link m--font-bolder" aria-expanded="true">\n ' + a + '</a>\n '
                    }
                }],

                //lengthMenu: [[10,25,50,100,-1], [10,25,50,100,"All"]],
                fixedHeader: {
                    header: false,
                    footer: false
                },
                /* buttons: ["print", "copyHtml5", "excelHtml5", "csvHtml5", "pdfHtml5"], */
                buttons: [
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6]
                        },
                        title: '${sessionScope.name}',
                        messageTop: function () {
                            return '<span class="sub-heading"><b>Product List </b><br/> ${sessionScope.firstDateFinancialYear} to ${sessionScope.lastDateFinancialYear}</span>';
                        },
                        autoPrint: true,
                        customize: function (win) {
                            $(win.document.body).find('h1').css('text-align', 'center');
                            $(win.document.body).find("div").css('text-align', 'center');

                            var css = '@page { size: auto;margin-top:5mm;margin-left:5mm;margin-right:5mm; }',
                                head = win.document.head || win.document.getElementsByTagName('head')[0],
                                style = win.document.createElement('style');
                            style.type = 'text/css';
                            style.media = 'print';

                            if (style.styleSheet) {
                                style.styleSheet.cssText = css;
                            } else {
                                style.appendChild(win.document.createTextNode(css));
                            }

                            head.appendChild(style);


                        }
                    },
                    {
                        extend: 'pdfHtml5',
                        //extension: '.pdf'
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6]
                        },
                        pageSize: 'LEGAL',
                        title: '${sessionScope.name}',
                        messageTop: function () {
                            return 'Product List \n ${sessionScope.firstDateFinancialYear} to ${sessionScope.lastDateFinancialYear}';
                        },
                        customize: function (doc) {
                            doc.styles.tableHeader = {
                                fillColor: "#88898c",
                                color: '#ffffff',
                                bold: 'true',
                            }

                            doc.styles.title = {
                                fontSize: '18',
                                alignment: 'center',
                                bold: 'true'
                            }
                            doc.pageMargins = [10, 20, 10, 10];
                            doc.content.forEach(function (item) {
                                if (item.table) {
                                    item.table.widths = [40, 85, 70, 125, 75, 75, 75];
                                    item.table.body[1][3].alignment = 'right';

                                    for (i = 0; i < item.table.body.length; i++) {
                                        item.table.body[i][0].alignment = 'center';
                                        item.table.body[i][1].alignment = 'left';
                                        item.table.body[i][2].alignment = 'left';
                                        item.table.body[i][3].alignment = 'left';
                                        item.table.body[i][4].alignment = 'right';
                                        item.table.body[i][5].alignment = 'right';
                                        item.table.body[i][6].alignment = 'right';
                                        item.table.body[i][6].margin = [0, 0, 5, 0];
                                    }

                                }
                            });

                            doc.styles.message = {
                                fontSize: '12',
                                alignment: 'center'
                            }
                        }
                    },
                    {
                        extend: 'excelHtml5',
                        //extension: '.pdf'
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6]
                        },
                        title: '${sessionScope.name}',
                        messageTop: function () {
                            return 'Product List \n ${sessionScope.firstDateFinancialYear} to ${sessionScope.lastDateFinancialYear}';
                        },
                        customize: function (doc) {

                            var sheet = doc.xl.worksheets['sheet1.xml'];

                        }
                    }
                ],
            }), $("#categoryVo,#brandVo").on("change", function () {
                $('#m_table_1').DataTable().draw()
            }), $("#export_print").on("click", function (e) {
                e.preventDefault(), $("#m_table_1").DataTable().button(0).trigger()
            }), $("#export_excel").on("click", function (e) {
                e.preventDefault(), $("#m_table_1").DataTable().button(2).trigger()
            }), $("#export_pdf").on("click", function (e) {
                e.preventDefault(), $("#m_table_1").DataTable().button(1).trigger()
            })
        }
    };

    jQuery(document).ready(function () {

        DatatablesDataSourceHtml.init();
        $('#categoryVo').select2();
        $('#brandVo').select2();

        $(".dt-buttons").addClass("m--hide");
    });
</script>

</body>
<!-- end::Body -->
</html>