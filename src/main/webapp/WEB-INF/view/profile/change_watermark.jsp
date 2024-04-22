<div class="modal fade" id="changewatermark" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    Change WaterMark
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">
						&times;
					</span>
                </button>
            </div>
            <form id="fileupload" action="/profile/changewatermark" enctype="multipart/form-data" method="post">
                <div class="modal-body">
                    <span class="form-text text-danger" id="">Image Have Must Be Transparent And Low Opposite</span>
                    <input type="hidden" name="userFrontId" id="userFrontId" value="${ProfileDetail.userFrontId}"/>
                    <!-- <div class="form-group m-form__group">

                        <input type="file" name="file" class="form-control" id="file" accept="image/jpg,image/png,image/jpeg">
                        <span class="form-text text-danger" id="file_error">Accepted formats: JPG,JPEG,PNG,BMP</span>
                    </div> -->
                    <div class="custom-file">
                        <input type="file" name="file" class="custom-file-input" id="file"
                               accept="image/jpg,image/png,image/jpeg">
                        <span class="form-text text-danger" id="file_error">Accepted formats: JPG,JPEG,PNG,BMP</span>
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" id="save" class="btn btn-primary">
                        Save
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>	
						