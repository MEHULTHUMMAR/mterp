<div class="modal fade" data-submit="#save_edit_contact" data-cancel="#cancel_edit_contact" id="contact_edit_modal"
     tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Edit Customer
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>	
            <div class="modal-body">
                <form id="contact_edit_form">
                    <div class="form-group row">
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">
                                Name:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                            </label>
                            <input type="text" autofocus name="editcustomerName" class="form-control"
                                   id="editcustomerName">
                            <input type="hidden" autofocus name="editcontactId" class="form-control"
                                   id="editcontactId">
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">
                                Company Name:
                            </label>
                            <input type="text" autofocus name="editcompanyName" class="form-control"
                                   id="editcompanyName">
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">
                                Mobile No.:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                            </label>
                            <input type="text" autofocus name="editmobileNo" class="form-control"
                                   id="editmobileNo">
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">
                                Email:
                            </label>
                            <input type="text" autofocus name="editemail" class="form-control"
                                   id="editemail">
                        </div>
                    <div class="col-md-4 form-group">
                        <label class="form-control-label">Address<span class="text-danger">*</span></label>
                        <textarea rows="2" id="editaddress" class="form-control form-control-sm" cols="2" name="address" placeholder="Address"></textarea>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="form-control-label">Select Country <span class="text-danger">*</span></label>
                        <select class="form-control m-select2" id="editcountriesCode" name="countriesCode" data-default="IN" onchange="getAllStateAjax('editcountriesCode','editstateCode')" placeholder="Select Country">
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="form-control-label">Select State<span class="text-danger">*</span></label>
                        <select class="form-control m-select2" id="editstateCode" name="stateCode" data-default="24" onchange="getAllCityAjax('editstateCode','editcityCode')" data-allow-clear="false" placeholder="Select State">
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="form-control-label">Select City<span class="text-danger">*</span></label>
                        <select class="form-control m-select2" id="editcityCode" name="cityCode" data-default="938" placeholder="Select City">
                        </select>
                    </div>
                    <div class="col-md-4 form-group">
                        <label class="form-control-label">Pincode Code</label>
                        <input type="text" class="form-control form-control-sm" name="pincode" id="editpincode" placeholder="ZIP/Postal Code" value="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_edit_contact" data-dismiss="modal">Close
                </button>
                <button type="button" id="save_edit_contact" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>