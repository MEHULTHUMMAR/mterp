<div class="modal fade" data-submit="#updatecategory" data-cancel="#cancelcategory" id="m_modal_7" tabindex="-1"
     role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header modal-header-sm">
                <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modal-body-sm">
                <form id="catupmodel">

                    <div class="form-group">
                        <label for="recipient-name">
                            Category Name<span style="font-size:1.25rem;" class="text-danger">*</span>
                        </label>
                        <input type="text" name="catupname" class="form-control form-control-sm" id="upcatname">
                        <input type="hidden" class="form-control form-control-sm" name="upcatid" id="upcatid">
                    </div>

                </form>
            </div>
            <div class="modal-footer modal-footer-sm">
                <button type="button" class="btn btn-sm btn-secondary" id="cancelcategory" data-dismiss="modal">Close</button>
                <button type="button" id="updatecategory" class="btn btn-sm btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>