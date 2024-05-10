<div class="modal fade bd-example-modal-lg" data-submit="#savecontact" data-cancel="#cancel_contact" id="contact_new_modal"
    role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    New Contact
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>	
            <div class="modal-body">
                <form id="contact_new_form">
                    <div class="form-group row">
                        <div class="col-md-4">
                        <label class="form-control-label">
                            Name:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                        </label>
                        <input type="text" autofocus name="customerName" class="form-control" onkeydown="check(event,this)"
                               id="customerName">
                        </div>
                         <div class="col-md-4">
                        <label class="form-control-label">
                            Company Name:
                        </label>
                         <input type="text" autofocus name="companyName" class="form-control" onkeydown="check(event,this)"
                               id="companyName">
                        </div>
                        <div class="col-md-4">
                        <label class="form-control-label">
                            Mobile No.:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                        </label>
                        <input type="text" autofocus name="mobileNo" class="form-control" onkeydown="check(event,this)"
                               id="mobileNo">
                        </div>
                        <div class="col-md-4">
                        <label class="form-control-label">
                            Email:
                        </label>
                        <input type="text" autofocus name="email" class="form-control" onkeydown="check(event,this)"
                               id="email">
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">Address<span class="text-danger">*</span></label>
                            <textarea rows="2" id="address" class="form-control form-control-sm" cols="2" name="address" placeholder="Address"></textarea>
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">Select Country <span class="text-danger">*</span></label>
                            <select class="form-control m-select2" id="countriesCode" name="countriesCode" data-default="IN" onchange="getAllStateAjax('countriesCode','stateCode')" placeholder="Select Country">
                            </select>
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">Select State<span class="text-danger">*</span></label>
                            <select class="form-control m-select2" id="stateCode" name="stateCode" data-default="24" onchange="getAllCityAjax('stateCode','cityCode')" data-allow-clear="false" placeholder="Select State">
                            </select>
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">Select City<span class="text-danger">*</span></label>
                            <select class="form-control m-select2" id="cityCode" name="cityCode" data-default="938" placeholder="Select City">
                            </select>
                        </div>
                        <div class="col-md-4 form-group">
                            <label class="form-control-label">Pincode Code</label>
                            <input type="text" class="form-control form-control-sm" name="pincode" id="pincode" placeholder="ZIP/Postal Code" value="">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_contact" data-dismiss="modal">Close
                </button>
                <button type="button" id="savecontact" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>