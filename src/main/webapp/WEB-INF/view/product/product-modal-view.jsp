<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"
 id="product_view_modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Product View
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
                                <input type="text" class="form-control m-input m_name" autofocus readonly
                                       name="itemcode" id="itemcode_view" placeholder="Item Code" value="">
                                <input type="hidden" id="product_id_view" name="productId" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Product
                                Name:</label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" autofocus readonly
                                       name="productName" id="productName_view" placeholder="Product Name" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Display
                                Name:</label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" autofocus readonly
                                       name="displayName" id="displayName_view" placeholder="Display Name" value="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Select
                                Category:</label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="input-group">
                                    <select class="form-control m-select2" id="categoryId_view" disabled
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
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Capacity:</label>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control m-input m_name" autofocus readonly
                                           name="capacity1" id="capacity1_view" placeholder="0.0" value="">
                                    To
                                    <input type="text" class="form-control m-input m_name" autofocus readonly
                                           name="capacity2" id="capacity2_view" placeholder="0.0" value="">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="input-group">
                                    <select class="form-control m-select2" id="unit_view" disabled
                                            name="unit" placeholder="Select Unit">
                                        <option value="">Select Unit</option>
                                        <option value="ml"selected="selected">ML</option>
                                        <option value="mg"selected="selected">MG</option>
                                        <option value="gm"selected="selected">GM</option>
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
                                        <input type="checkbox" name="certificateRequired" value="0" onclick="$(this).val(this.checked ? 1 : 0)" disabled
                                               id="certificateRequired_view">Certificate Required<span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Description:</label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
									<textarea class="form-control m-input" id ="description_view" name="description" readonly
                                              placeholder="Enter Description"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" text-center" id="fileDiv_view"> <h5 class="modal-title  text-center" id="">Upload Document</h5><small>(You can select only 10 images)</small>


                    <div class="table-responsive">
                        <table class="table" id="all_prodcut_tbl_view">
                            <thead>
                            <tr>
                                <th>Sr No.</th>
                                <th>Document Name</th>
                                <th>Remark</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody data-purchase-list="" id="prodcut_tbl_body_view">
                            <tr class="text-center m--hide" id="{index}" data-purchase-item="template">
                                <td class="align-middle" style="width: 100px"><span class="m--font-bolder" data-item-index id="srNo_view{index}"></span>
                                </td>
                                <td class="align-middle" style="width: 300px">
                                    <input class="form-control " type="text" name="productDocVos[{index}].fileName" id="fileName_view{index}" readonly="" value="" style="background: none;">

                                </td>

                                <td class="align-middle" style="width: 150px">
                                    <textarea rows="" cols="" id="remark_view{index}" name="productDocVos[{index}].remark" readonly></textarea>
                                </td>
                                <td class="" style="width: 40px;">
                                    <a href="#"  id="file_download{index}" target="_blank"	class="btn m-btn m-btn--icon m-btn--icon-only m-btn--pill"
                                       style="margin-right: 0px; margin-top: 0px;"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_edit_product" data-dismiss="modal">Close
                </button>

            </div>
            </form>
        </div>
    </div>
</div>