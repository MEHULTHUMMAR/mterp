<div class="modal fade modal-dialog-scrollable"  aria-hidden="true"
     data-submit="#savedrawinglogic" data-cancel="#cancel_drawinglogic" id="drawinglogic_new_modal" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form id="drawinglogic_new_form">
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

                    </div>


                 <div class="form-group row" style="border: 1px solid; padding: 5px;">
                    <label class="col-form-label col-lg-4 col-md-4 col-sm-4">Drawing Logic Code:</label>
                     <div class="col-lg-4 col-md-4 col-sm-4">
                         <div class="form-group m-form__group row m--padding-left-0">
                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <input type="text" class="form-control m-input m_name" readonly
                                        name="drawingLogicCode" id="drawingLogicCode" placeholder="Drawing Logic Code" value="">
                             </div>
                         </div>
                     </div>
                     <div class="col-lg-4 col-md-4 col-sm-4"></div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                <div class="m-checkbox-inline">
                                    <label class="m-checkbox m-checkbox--solid m-checkbox--brand">STD
                                <input type="checkbox" name="isStd" value="0" onclick="$(this).val(this.checked ? 1 : 0)" checked
                                       onchange="generate_DLNumber()"                id="isStd"><span></span></label>
                                </div>
                            </label>
                            </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" readonly onchange="generate_DLNumber()"
                                       name="stdCode" id="stdCode" placeholder="std code" value="STD">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Product Category: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="productCategory" name="productCategory" onchange="generate_DLNumber()"
                                        placeholder="Select Product Category">
                                    <option value="0">Select Product Category</option>
                                    </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Product Capacity: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="productCapacity" name="productCapacity" onchange="generate_DLNumber()"
                                        placeholder="Select Product Capacity">
                                    <option value="0">Select Product Capacity</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Orientation: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="orientation" name="orientation" onchange="generate_DLNumber()"
                                        placeholder="Select orientation">
                                    <option value="0">Select orientation</option>
                                </select>
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Sub Assembly no.: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" onchange="generate_DLNumber()"
                                       name="subAssemblyNo" id="subAssemblyNo" placeholder="Sub Assembly no" value="">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Part no.: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" onchange="generate_DLNumber()"
                                       name="partNo" id="partNo" placeholder="Part no" value="">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Process no.: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" onchange="generate_DLNumber()"
                                       name="processNo" id="processNo" placeholder="Process no" value="">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Revision no.: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" onchange="generate_DLNumber()"
                                       name="revisionNo" id="revisionNo" placeholder="Revision no" value="">
                            </div>
                        </div>
                    </div>

                </div>


                 <div class="form-group row" style="border: 1px solid; padding: 5px;">
                    <label class="col-form-label col-lg-4 col-md-4 col-sm-4">Raw material Code:</label>
                     <div class="col-lg-4 col-md-4 col-sm-4">
                         <div class="form-group m-form__group row m--padding-left-0">
                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <input type="text" class="form-control m-input m_name" readonly
                                        name="rawMaterialCode" id="rawMaterialCode" placeholder="Raw Material Code" value="">
                             </div>
                         </div>
                     </div>
                     <div class="col-lg-4 col-md-4 col-sm-4"></div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Raw material: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="rawMaterial" name="rawMaterial" onchange="generate_RMCode()"
                                        placeholder="Select Raw material">
                                </select>
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">Raw material type: </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="rawMaterialType" name="rawMaterialType" onchange="generate_RMCode()"
                                        placeholder="Raw material type">
                                </select>
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">MOC : </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <select class="form-control" id="moc" name="moc" onchange="generate_RMCode()"
                                        placeholder="Select MOC">
                                </select>
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">SIZE 1 : </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name" onchange="generate_RMCode()"
                                       name="size1" id="size1" placeholder="Size 2" value="">
                            </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                         <div class="form-group m-form__group row m--padding-left-0">
                             <label class="col-form-label col-lg-12 col-md-12 col-sm-12">SIZE 2 : </label>
                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <input type="text" class="form-control m-input m_name" onchange="generate_RMCode()"
                                        name="size2" id="size2" placeholder="Size 2" value="">
                             </div>
                         </div>
                     </div>

                     <div class="col-lg-4 col-md-4 col-sm-4">
                         <div class="form-group m-form__group row m--padding-left-0">
                             <label class="col-form-label col-lg-12 col-md-12 col-sm-12">SIZE 3 : </label>
                             <div class="col-lg-12 col-md-12 col-sm-12">
                                 <input type="text" class="form-control m-input m_name" onchange="generate_RMCode()"
                                        name="size3" id="size3" placeholder="Size 3" value="">
                             </div>
                         </div>
                     </div>
                </div>

                <div class="form-group row">

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                <div class="m-checkbox-inline">
                                    <label class="m-checkbox m-checkbox--solid m-checkbox--brand">Hardware Code
                                        <input type="checkbox" name="isHardwareCode" value="0" onclick="$(this).val(this.checked ? 1 : 0)"
                                               id="isHardwareCode"><span></span></label>
                                </div>
                            </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name"  readonly
                                       name="hardwareCode" id="hardwareCode" placeholder="Hardware Code" value="">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="form-group m-form__group row m--padding-left-0">
                            <label class="col-form-label col-lg-12 col-md-12 col-sm-12">
                                <div class="m-checkbox-inline">
                                    <label class="m-checkbox m-checkbox--solid m-checkbox--brand">Miscellaneous Code
                                        <input type="checkbox" name="isMiscellaneous" value="0" onclick="$(this).val(this.checked ? 1 : 0)"
                                               id="isMiscellaneous"><span></span></label>
                                </div>
                            </label>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <input type="text" class="form-control m-input m_name"  readonly
                                       name="miscellaneousCode" id="miscellaneousCode" placeholder="Miscellaneous Code" value="">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="form-group row">
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