<div class="modal fade" data-submit="#save_edit_coupon" data-cancel="#cancel_edit_coupon" id="coupon_edit_modal"
     tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Edit Coupon
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>	
            <div class="modal-body">
                <form id="coupon_edit_form">
                    <div class="form-group ">
                    <input type="hidden" id="coupon_id" >
                    <label class="col-form-label col-lg-12 col-md-12 col-sm-12">
                    	<span class="m--font-bolder">Coupon Type:</span>
                    </label>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <input type="hidden" name="type" id="coupon_type_edit_model" value="Discount">
                        <input data-switch="true" type="checkbox" checked="checked" name="types" value="Discount"
                               id="edittypeswitch" data-on-text="Discount"
                               data-handle-width="70" data-off-text="Free Product"
                               data-on-color="brand" data-off-color="info">
                    </div>
               	 </div>
<input type="hidden" name="editotpverify" id="editotpverify" value="1">
                    <!-- <div class="form-group ">
                        <label class="col-form-label col-lg-12 col-md-12 col-sm-12">
                            <span class="m--font-bolder">OTP Verify:</span>
                        </label>
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <input type="hidden" name="editotpverify" id="editotpverify" value="0">
                            <input data-switch="true" type="checkbox" name="otpverify" value="0"
                                   id="sweditotpverify" data-on-text="Yes"
                                   data-handle-width="70" data-off-text="No"
                                   data-on-color="brand" data-off-color="info">
                        </div>
                    </div> -->

                    <div class="form-group">
                        <label class="form-control-label">
                            Points:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                        </label>
                        <input type="text" autofocus name="points_edit_model" class="form-control" onkeydown="check(event,this)"
                               id="points_edit_model">
                    </div>
                     <div class="form-group">
                        <label class="form-control-label">
                            Product Description Or Name:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                        </label>
                        <textarea class="form-control m-input" name="description_edit_model" id="description_edit_model" placeholder="Enter Description Or Product name"></textarea>
                    </div>
                     <div class="form-group" id="discount_div_new">
                        <label class="form-control-label">
                            Discount:<span style="font-size:1.25rem; color:red;" class="text-danger">*</small>
                        </label>
                        <div class="input-group">
                         <input type="hidden" class="form-control m-input" id="discount_type_edit_model" name="discountType" placeholder="Discount" value="percentage">
                          <div class="input-group-prepend"
                               style="display: flex; flex-direction: column">
                              <button class="btn btn-secondary btn-icon"
                                      type="button"
                                      id="btn_amount_edit_model" onclick="btnpercentageEdit()"
                                      style="background-color: #ebedf2;z-index:0 !important;">
                                  <i class="fa fa-rupee-sign m--font-brand"
                                     style="padding: 0.6rem; padding-right: 0.8rem"></i>
                              </button>
                              <button class="btn btn-secondary" type="button"
                                      id="btn_percentage_edit_model" onclick="btnamountEdit()"
                                      style="background-color: #ebedf2;z-index:0 !important;">
                                  <i class="fa fa-percentage m--font-info" style="padding: 0.6rem;"></i></button>
                              
                          </div>
                        <input type="text" class="form-control" id="discount_edit_model"
                               name="discount_edit_model"
                               placeholder="Percentage"
                               onkeyup="this.value =minmaxedit(this.value, 0, 100)">
                                                            </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="cancel_edit_coupon" data-dismiss="modal">Close
                </button>
                <button type="button" id="save_edit_coupon" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>