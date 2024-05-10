<div class="modal fade bd-example-modal-lg"  role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"
     data-submit="#savecontact" data-cancel="#cancel_contact" id="drawinglogic_modal" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
           <%-- <form action="/product/saveproduct" class="" method="post" id="product_new_form" enctype="multipart/form-data">--%>

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Drawing Logic
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>	
            <div class="modal-body">
                    <div class="form-group row">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-6 col-md-6 col-sm-6">Planing No:</label>
                                <input type="hidden" id="dl_planing_item_id">
                                <label class="col-form col-lg-6 col-md-6 col-sm-6" style="padding-top: calc(.85rem + 1px); padding-bottom: calc(.85rem + 1px);" id="dl_planingNo"> </label>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-6 col-md-6 col-sm-6">Enquire No:</label>
                                <label class="col-form col-lg-6 col-md-6 col-sm-6" style="padding-top: calc(.85rem + 1px); padding-bottom: calc(.85rem + 1px);" id="dl_enquireNo"></label>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-6 col-md-6 col-sm-6">Product Name:</label>
                                <label class="col-form col-lg-6 col-md-6 col-sm-6" style="padding-top: calc(.85rem + 1px); padding-bottom: calc(.85rem + 1px);" id="dl_productName"></label>
                            </div>
                        </div>
                    </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-sm m-table table-bordered table-hover mb-0" id="product_table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th >Design Logic No</th>
                                <th>PDF</th>
                                <th>Costing</th>
                                <th>BOM</th>
                            </tr>
                            </thead>
                            <tbody data-sales-list="">
                            <tr data-sales-item="template" class="m--hide">

                                <td style="width: 50px;"><span data-item-index></span></td>

                                <td class="form-group mb-0 pname">
                                    <div class="d-flex">
                                        <input type="text"
                                               class="form-control form-control-sm " readonly name="dlNo[{index}]" id="dlNo{index}"   placeholder="dlNo" value="" />
                                    </div>
                                </td>

                                <td style="width: 100px;">
                                    <div class="p-0 m--font-bolder form-group mb-0"
                                         data-item-qty="">
                                        <a href="" id="dlPDF{index}">Download File</a>
                                    </div>
                                </td>
                                <td class="form-group mb-0 pname">
                                    <div class="d-flex">
                                        <input type="text"
                                               class="form-control form-control-sm " readonly name="dlcosting[{index}]" id="dlcosting{index}"   placeholder="dlNo" value="" />
                                    </div>
                                </td>
                                <td>
                                    <a href="#" id ="bom_generate{index}" onclick=""
                                       class="btn btn-primary m-btn btn-sm m-btn--icon m-btn--air m--hide">
                                        <span><span>Generate BOM</span></span>
                                    </a>
                                    <a href="#" id ="bom_link{index}" onclick="" target="_blank"
                                       class=" m--hide">
                                        <span id="bom_no{index}"></span>
                                    </a>
                                </td>


                            </tr>

                            </tbody>

                        </table>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_product" data-dismiss="modal">Close
                </button>
                <button type="button" id="completeDL" onclick="completeDL()" class="btn btn-primary">Complete</button>
            </div>
   <%-- </form>--%>
        </div>
    </div>
</div>