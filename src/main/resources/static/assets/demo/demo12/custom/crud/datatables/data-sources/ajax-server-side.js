var DatatablesDataSourceAjaxServer = {
    init: function () {
        $("#m_table_1").DataTable({
            responsive: !0,
            searchDelay: 500,
            processing: !0,
            serverSide: !0,
            ajax: "https://keenthemes.com/metronic/preview/inc/api/datatables/demos/server.php",
            columns: [{
                data: "RecordID"
            }, {
                data: "OrderID"
            }, {
                data: "Country"
            }, {
                data: "ShipCity"
            }, {
                data: "ShipAddress"
            }, {
                data: "CompanyAgent"
            }, {
                data: "CompanyName"
            }, {
                data: "ShipDate"
            }, {
                data: "Status"
            }, {
                data: "Type"
            }, {
                data: "Actions"
            }],
        })
    }
};
jQuery(document).ready(function () {
    DatatablesDataSourceAjaxServer.init()
});