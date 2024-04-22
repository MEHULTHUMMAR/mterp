<!--begin::Modal-->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="<%=request.getContextPath()%>/webjars/sockjs-client/sockjs.min.js"></script>
<script src="<%=request.getContextPath()%>/webjars/stomp-websocket/stomp.min.js"></script>

<div class="modal fade" id="help_modal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Help
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="invoiceTable" class="table ">
                    <tr class="row help-table-tr">
                        <td class="col-1">F1</td>
                        <td class="col-11">Help</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F2</td>
                        <td class="col-11">Dashboard</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F3</td>
                        <td class="col-11">New Invoice</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F4</td>
                        <td class="col-11">New Estimate</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F6</td>
                        <td class="col-11">New Supplier Bill</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F7</td>
                        <td class="col-11">New Product</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F8</td>
                        <td class="col-11">New Pos</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F9</td>
                        <td class="col-11">New Customer</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F10</td>
                        <td class="col-11">New Supplier</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F11</td>
                        <td class="col-11">New Payment</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F12</td>
                        <td class="col-11">New Receipt</td>
                    </tr>
                    <!-- <tr class="row help-table-tr">
                        <td class="col-1">F11</td>
                        <td class="col-11">New Product</td>
                    </tr>
                    <tr class="row help-table-tr">
                        <td class="col-1">F12</td>
                        <td class="col-11">New Pos</td>
                    </tr> -->
                    <!-- <tr class="row help-table-tr">
                        <td class="col-1"></td>
                        <td class="col-11">Ctrl+S - Save and Ctrl+C - Cancel</td>
                    </tr> -->
                </table>
            </div>
        </div>
    </div>
</div>

<!--end::Modal-->




<script>
    var settingDecimal = 2;
    $(document).ready(function () {
        //Mousetrap.bind(['f1'], function() { window.location.replace("/dashboard");  });

        //Apply State save property to all datatable
        if ($.fn.dataTable != undefined) {
            $.extend(true, $.fn.dataTable.defaults, {
                "dom": "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
                /* "stateSave": true, */
                "language": {
                    "processing": "<div class='fa-3x loading pt-1 rounded border'><spna class=''><i class='fas fa-sync fa-spin'></i>&nbsp;&nbsp;Table is Processing...</span></div>"
                },
                //"stateDuration": 60 * 60 * 24*365,
            });
        }

        //remove whitespace when paste
        $(":input").bind("paste", function (e) {
            $(this).val($.trim($(this).val()));
        })
        //For Datatable 1
        //Custom Datatable Length
        $("#datatableCustomTableLengthSelectBox").on("change", function (e) {
            table.page.len($(this).val()).draw()
        })
        //Custom Search
        $("#datatableCustomSearchInput").on("keyup", function (e) {
            table.search($(this).val()).draw()
        })

        //For Datatable 2
        //Custom Datatable Length
        $("#datatableCustomTableLengthSelectBox2").on("change", function (e) {
            table2.page.len($(this).val()).draw()
        })
        //Custom Search
        $("#datatableCustomSearchInput2").on("keyup", function (e) {
            table2.search($(this).val()).draw()
        })

        //For Datatable 3
        //Custom Datatable Length
        $("#datatableCustomTableLengthSelectBox3").on("change", function (e) {
            table3.page.len($(this).val()).draw()
        })
        //Custom Search
        $("#datatableCustomSearchInput3").on("keyup", function (e) {
            table3.search($(this).val()).draw()
        })


       

        document.querySelectorAll('body,.modal').forEach(function (f) {

            f.addEventListener('keydown', function (e) {

                var key = e.which || e.keyCode;


                if (e.keyCode == 83 && (navigator.platform.match("Mac") ? e.metaKey : e.ctrlKey)) {
                    if (f.getAttribute('data-submit') != null) {
                        e.preventDefault();
                        $(f.getAttribute('data-submit')).click();
                        e.stopPropagation();
                    }
                }

                if (e.keyCode == 80 && (navigator.platform.match("Mac") ? e.metaKey : e.altKey)) {

                    window.location.replace("/product/opening-stock");

                }


            });
        });


        //$('form :input:text:radio:visible:not(input[class*=filter]):first').focus();

      
       

    });

    function lastUrl() {
        var referrer = document.referrer;
        window.location = referrer;
    }

    

    var stompClientadmin = null;

    function connect() {
        ///////////////////
        var socket = new SockJS('/gs-guide-websocket');
        console.log(socket)
        stompClient = Stomp.over(socket);
        stompClient.connect({
                "user": ${sessionScope.userId}
            }
            , function (frame) {

                console.log('Connected: ' + frame);
                stompClient.subscribe('/user/queue/reply',
                    function (greeting) {

                        toastr.info("You recived notification", JSON.parse(greeting.body).content);
                      
                    });

            });
      
        return stompClient;
    }
    connect();
    function disconnect() {
        if (stompClient != null) {
            stompClient.disconnect();
        }
	}
    function sendnotify(msg, touser, url) {

        stompClient.send("/app/notify", {}, JSON.stringify({
            'msg': msg,
            'toUser': touser,
            'url': url
        }));
    }
</script>