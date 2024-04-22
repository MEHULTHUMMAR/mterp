<div class="modal fade" id="new_password_model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 " id="">
                        <div class="form-group m-form__group row m--margin-top-5">

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="form-group m-form__group row m--margin-top-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <input type="password" class="form-control m-input" id="password" name=""
                                               placeholder="New Password"
                                               onChange="checkPassword()" value="" required>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="form-group m-form__group row m--margin-top-5">
                                    <div class="col-lg-12 col-md-12 col-sm-12">
                                        <input type="password" class="form-control m-input" id="confirmPassword" name=""
                                               placeholder="Confirm New Password" onKeyUp="checkPassword()" required
                                               value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button"
                        class="btn btn-brand btn-block m--font-boldest m--regular-font-size-lg5 pull-right"
                        id="changepassword" onclick="changepassword()">Change
                </button>
            </div>
        </div>
    </div>
</div>
						