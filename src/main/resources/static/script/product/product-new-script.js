/**
 * This File is For Department New Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {

    //----------Department------------
    $("#product_new_form1").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#saveproduct1",
            disabled: "disabled",
        },
        icon: null,
        fields: {
            productName: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The  Product Name is required.'
                    }
                }
            },itemcode: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The itemcode is required. '
                    }
                }
            },categoryId: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The Category is required. '
                    }
                }
            }

        }
    }).on('success.form.fv', function (e) {
	  	e.preventDefault();//stop the from action methods
        const form = $("#product_new_form");

        var filenames="",ids="";
        $("#all_prodcut_tbl").find("[data-purchase-item='template']").remove();
        var $purchaseItem = $("#all_prodcut_tbl").find("[data-purchase-item]").not(".m--hide");
        $purchaseItem.each(function() {
            var index=this.id;
            ids+=index+",";
            filenames+=$("#fileName"+index).val()+",";
        })
        $("#fileNames").val(filenames);
        $("#ids").val(ids);
        $("#saveproduct").attr("disabled", true);
        var formData = form.serializeArray();
        var fileInput = document.getElementById('uploadFiles');
        formData.append('uploadFiles', fileInput);

        $.ajax({
            url: "/product/saveproduct",
            type: "POST",
            data: formData,
             success: function(blob, status, xhr) {
                // check for a filename
                toastr["success"]("Record Inserted....");
                $('#contact_new_modal').modal('toggle');
                table.ajax.reload();
            },
        });
   });

    $('#product_new_modal').on('shown.bs.modal', function () {
        $('#product_new_form').formValidation('resetForm', true);
    	$("#productName").focus();
        $("#categoryId").select2();
        $("#uom").select2();
 	});


    $("#saveproduct").click(function () {
      //  $('#product_new_form').data('formValidation').validate();


        var filenames="",ids="";
        $("#all_prodcut_tbl").find("[data-purchase-item='template']").remove();
        var $purchaseItem = $("#all_prodcut_tbl").find("[data-purchase-item]").not(".m--hide");
        $purchaseItem.each(function() {
            var index=this.id;
            ids+=index+",";
            filenames+=$("#fileName"+index).val()+",";
        })
        $("#fileNames").val(filenames);
        $("#ids").val(ids);

    });

    //----------End Department------------
});


function FileDetails() {
    // GET THE FILE INPUT.
    var fi = document.getElementById('file');
    // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
    if (fi.files.length > 0) {

        var totalFiles=0;
        for (var i = 0; i <= fi.files.length - 1; i++) {
            console.log(fi.files)
            if(i<10){
                var fname = fi.files.item(i).name; // THE NAME OF THE FILE.
                var fsize = fi.files.item(i).size; // THE SIZE OF THE FILE.
                //var index = i + 1;

                var $purchaseItemTemplate;
                var mainIndex = i;
                var selector = "{index}";
                $purchaseItemTemplate = $("#all_prodcut_tbl").find("[data-purchase-item='template']").clone();
                $purchaseItemTemplate.find("[data-purchase-item-toggle]").remove();
                $purchaseItemTemplate.attr("data-purchase-item", mainIndex).removeClass("m--hide");
                $purchaseItemTemplate.attr("id", mainIndex);
                $purchaseItemTemplate.find("input[type='text'],button,select,span,textarea").each(function () {
                    n = $(this).attr("id");
                    n ? $(this).attr("id", n.replace(/{index}/g, mainIndex)) : "";

                    n = $(this).attr("name");
                    n ? $(this).attr("name", n.replace(/{index}/g, mainIndex)) : "";

                    $(this).attr("data-select2-id") ? $(this).attr("data-select2-id", $(this).attr("data-select2-id").replace(/{index}/g, mainIndex)) : "";
                });
                $("#all_prodcut_tbl").find("[data-purchase-list]").append($purchaseItemTemplate);
                $("#srNo"+i).html(i+1);
                $("#fileName"+i).val(fname);
            }
            totalFiles++;
        }
        document.getElementById('Filemessage').innerHTML =
            'Total Files: <b>' + totalFiles + '</b></br >';
    } else {
        $('#Filemessage').text("Drag your files here or click in this area.");
    }
}