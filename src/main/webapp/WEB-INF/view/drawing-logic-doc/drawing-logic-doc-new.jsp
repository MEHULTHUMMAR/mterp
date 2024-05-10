<div class="modal fade bd-example-modal-lg"  role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"
     data-submit="#savedrawinglogic" data-cancel="#cancel_drawinglogic" id="drawinglogic_new_modal" >
    <div class="modal-dialog modal-lg">
<%--<div class="modal fade" data-submit="#savecontact" data-cancel="#cancel_contact" id="product_new_modal" aria-hidden="true">--%>
<%--    <div class="modal-dialog " role="document">--%>
        <div class="modal-content">
            <form action="" method="post" enctype="multipart/form-data" id="drawinglogic_new_form">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    New Drawing Logic
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>	
            <div class="modal-body">
                    <div class="form-group row">
                        <div class="col-lg-5 col-md-5 col-sm-5">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">drawing Logic Doc No:</label>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" class="form-control m-input m_name" autofocus readonly
                                           name="prefix" id="prefix" placeholder="Prefix" value="${prefix}">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" class="form-control m-input m_name" autofocus readonly
                                           name="drawingLogicDocNo" id="drawingLogicDocNo" placeholder="Drawing Logic Doc No" value="${planingNo}">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Product:</label>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <select class="form-control" id="productId"
                                            name="productVo.productId"
                                            placeholder="Select product">
                                        <option value="0">Select product</option>
                                        <c:forEach items="${productList}" var="productList">
                                            <option value="${productList.productId}"> ${productList.productName} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-2">
                            <div class="form-group m-form__group row m--padding-left-0">
                                <label class="col-form-label col-lg-12 col-md-12 col-sm-12"></label>
                                <div class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                    <div class="m-checkbox-inline">
                                        <label class="m-checkbox m-checkbox--solid m-checkbox--brand">
                                            <input type="checkbox" name="gaFlag" value="0" onclick="$(this).val(this.checked ? 1 : 0)"
                                                   id="gaFlag">GA<span></span>
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
                    <div class=" text-center" id="fileDiv"> <h5 class="modal-title  text-center" id="">Upload Document</h5>
                        <div class="input-group">
                            <input type="text" class="form-control m-input" name="fileTextBox"
                                   id="updateFileTextBox"
                                   readonly="readonly"/>
                            <div class="input-group-append" onclick="clickUpdateFileBtn()" style="cursor:pointer">
													<span class="input-group-text">
														<i class="la la-file"></i>
													</span>
                            </div>
                            <input id="docFile" name="docFile" type="file"
                                   style="display: none;"
                                   required="required"/>
                        </div>
                                       </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_drawinglogic" data-dismiss="modal">Close
                </button>
                <button type="button" id="savedrawinglogic" class="btn btn-primary">Save</button>
            </div>
    </form>
        </div>
    </div>
</div>