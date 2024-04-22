var DropzoneDemo = {
    init: function () {
        Dropzone.options.mDropzoneOne = {
            paramName: "file",
            maxFiles: 1,
            maxFilesize: 5,
            addRemoveLinks: !0,
            accept: function (e, o) {
                "justinbieber.jpg" == e.name ? o("Naha, you don't.") : o()
            }
        }, Dropzone.options.mDropzoneTwo = {
            paramName: "file",
            maxFiles: 10,
            maxFilesize: 10,
            addRemoveLinks: true,
            accept: function (e, o) {
                "justinbieber.jpg" == e.name ? o("Naha, you don't.") : o()
            },
            success: function (file, response) {
                if (response.imageId != 0) {
                    $imageItem = $("#all_image_div").find("[data-image-item='template']").clone();
                    $imageItem.removeClass("m--hide").attr('data-image-item', response.imageId);
                    $imageItem.find("img").attr("src", "${Constant.REALPATH}" + response.src);

                    $("#all_image_div").append($imageItem);
                } else {
                    this.removeFile(file);
                    $('#error_alert').fadeIn('slow');

                    setTimeout(() => {
                        $('#error_alert').fadeOut('slow');
                    }, 4000);
                }
            }
        }, Dropzone.options.mDropzoneThree = {
            paramName: "file",
            maxFiles: 10,
            maxFilesize: 10,
            addRemoveLinks: !0,
            acceptedFiles: "image/*,application/pdf,.psd",
            accept: function (e, o) {
                "justinbieber.jpg" == e.name ? o("Naha, you don't.") : o()
            }
        }
    }
};
DropzoneDemo.init();