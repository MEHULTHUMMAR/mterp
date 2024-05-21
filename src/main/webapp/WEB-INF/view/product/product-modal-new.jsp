<div class="modal fade bd-example-modal-lg"  role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"
     data-submit="#savecontact" data-cancel="#cancel_contact" id="product_new_modal" >
    <div class="modal-dialog modal-lg">
<%--<div class="modal fade" data-submit="#savecontact" data-cancel="#cancel_contact" id="product_new_modal" aria-hidden="true">--%>
<%--    <div class="modal-dialog " role="document">--%>
        <div class="modal-content">
            <form action="/product/saveproduct" class="" method="post" id="product_new_form" enctype="multipart/form-data">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    New Product
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
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Item Code:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <input type="text" class="form-control m-input m_name" autofocus
                                           name="itemcode" id="itemcode" placeholder="Item Code" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Product
                                    Name:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <input type="text" class="form-control m-input m_name" autofocus
                                           name="productName" id="productName" placeholder="Product Name" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Display
                                    Name:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <input type="text" class="form-control m-input m_name" autofocus
                                           name="displayName" id="displayName" placeholder="Display Name" value="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Select
                                    Category:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="input-group">
                                        <select class="form-control m-select2" id="categoryId"
                                                name="categoryVo.categoryId" placeholder="Select Category">
                                            <option value="">Select Category</option>
                                            <c:forEach items="${categoryList}" var="categoryList">
                                                <option value="${categoryList.categoryId}" >
                                                        ${categoryList .categoryName}</option>
                                            </c:forEach>
                                        </select>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-6 col-md-6 col-sm-12">Capacity:</label>
                                <label class="col-form-label col-lg-6 col-md-6 col-sm-12">Unit:</label>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control m-input m_name" autofocus
                                               name="capacity1" id="capacity1" placeholder="0.0" value="">
                                        To
                                        <input type="text" class="form-control m-input m_name" autofocus
                                               name="capacity2" id="capacity2" placeholder="0.0" value="">
                                    </div>
                                </div>

                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="input-group">
                                        <select class="form-control m-select2" id="unit"
                                                name="unit" placeholder="Select Unit">
                                            <option value="">Select Unit</option>
                                                <option value="ml"selected="selected">ML</option>
                                            <option value="mg">MG</option>
                                            <option value="gm"      >GM</option>
                                        </select>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12"></label>
                                <div class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                    <div class="m-checkbox-inline">
                                        <label class="m-checkbox m-checkbox--solid m-checkbox--brand">
                                            <input type="checkbox" name="certificateRequired" value="0" onclick="$(this).val(this.checked ? 1 : 0)"
                                                   id="certificateRequired">Certificate Required<span></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-4">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Description:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
									<textarea class="form-control m-input" id ="description" name="description"
                                              placeholder="Enter Description"></textarea>
                                </div>
                            </div>
                        </div>




                    </div>
                    <div class=" text-center" id="fileDiv"> <h5 class="modal-title  text-center" id="">Upload Document</h5><small>(You can select only 10 images)</small>
                        <input type="hidden" id="fileNames" name="fileNames">
                        <input type="hidden" id="ids" name="ids">
                        <div id="uploadBulkFile" class="m-b-30">
                            <input type="file" id="file" name="uploadFiles" onchange="FileDetails()"  multiple >
                            <p class="text-center" id="Filemessage">Drag your files here or click in this area.</p>
                        </div>

                        <div class="table-responsive">
                            <table class="table" id="all_prodcut_tbl">
                                <thead>
                                <tr>
                                    <th>Sr No.</th>
                                    <th>Document Name</th>
                                    <th>Remark</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody data-purchase-list="" id="prodcut_tbl_body">
                                <tr class="text-center m--hide" id="{index}" data-purchase-item="template">
                                    <td class="align-middle" style="width: 100px"><span class="m--font-bolder" data-item-index id="srNo{index}"></span>
                                    </td>
                                    <td class="align-middle" style="width: 300px">
                                        <input class="form-control " type="text" name="productDocVos[{index}].fileName" id="fileName{index}" readonly="" value="" style="background: none;">
                                    </td>

                                    <td class="align-middle" style="width: 150px">
                                        <textarea rows="" cols="" id="remark{index}" name="productDocVos[{index}].remark"></textarea>
                                    </td>
                                    <td class="" style="width: 40px;">
                                        <a href="#" data-item-remove=""	class="btn m-btn m-btn--icon m-btn--icon-only m-btn--pill remove-rows"
                                           style="margin-right: 0px; margin-top: 0px;"><i class="fa fa-trash"></i></a>
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
                <button type="submit" id="saveproduct" class="btn btn-primary">Save</button>
            </div>
    </form>
        </div>
    </div>
</div>