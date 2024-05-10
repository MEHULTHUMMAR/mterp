<div class="modal fade" data-submit="#savecategory" data-cancel="#cancelcategory" id="category_new_model" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-sm">
                <h5 class="modal-title" id="exampleModalLabel">
                    New Category
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">
												&times;
											</span>
                </button>
            </div>
            <div class="modal-body modal-body-sm">
                <form id="categorynewmodel">

                    <div class="form-group">
                        <label for="recipient-name">
                            Category Name<span style="font-size:1.25rem;" class="text-danger">*</span>
                        </label>
                        <input type="text" name="category" placeholder="Enter Category Name" class="form-control form-control-sm" id="category">
                    </div>

                </form>
            </div>
            <div class="modal-footer modal-footer-sm">
                <button type="button" id="cancelcategory" class="btn btn-sm btn-secondary" data-dismiss="modal">
                    Close
                </button>
                <button type="button" id="savecategory" class="btn btn-sm btn-primary">
                    Save
                </button>
            </div>
        </div>
    </div>
</div>
						