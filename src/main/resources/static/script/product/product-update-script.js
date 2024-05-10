/**
 * This File is For Department Update Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {

    //----------Department------------
    $("#product_edit_form1").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#save_edit_product1",
            disabled: "disabled",
        },
        icon: null,
        fields: {
            editcustomerName: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The  customer Name is required.'
                    }
                }
            },editmobileNo: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The mobile No. is required. '
                    }
                }
            }
        }
    }).on('success.form.fv', function (e) {
        e.preventDefault();//stop the from action methods
        $("#save_edit_contact").attr("disabled", true);
       $.post("/product/saveproduct", {
           customerName: $('#editcustomerName').val(),
           companyName: $('#editcompanyName').val(),
           mobileNo: $('#editmobileNo').val(),
           email: $('#editemail').val(),
           contactId:$('#editcontactId').val(),

        }, function (data, status) {
            toastr["success"]("Record Inserted....");
            $('#contact_edit_modal').modal('toggle');
           table.ajax.reload();
		});
    });

    $("#save_edit_product").click(function () {
        //  $('#product_new_form').data('formValidation').validate();
        var filenames="",ids="";
        $("#all_prodcut_tbl_edit").find("[data-purchase-item='template']").remove();
        var $purchaseItem = $("#all_prodcut_tbl_edit").find("[data-purchase-item]").not(".m--hide");
        $purchaseItem.each(function() {
            var index=this.id;
            ids+=index+",";
            filenames+=$("#fileName_edit"+index).val()+",";
        })
        $("#fileNames_edit").val(filenames);
        $("#ids_edit").val(ids);

    });
    //----------End Department------------
    $('#product_edit_modal').on('shown.bs.modal', function () {
        $("#save_edit_product").prop('disabled',false);

    });

});


function FileDetailsEdit() {
    // GET THE FILE INPUT.
    var fi = document.getElementById('file_edit');
    // VALIDATE OR CHECK IF ANY FILE IS SELECTED.
    if (fi.files.length > 0) {

        var totalFiles = 0;
        var mainIndex = 0;
        var $purchaseItem = $("#all_prodcut_tbl_edit").find("[data-purchase-item]").not(".m--hide");
        $purchaseItem.each(function() {
            mainIndex=this.id;
            totalFiles++;
        })
        mainIndex++;
        console.log(mainIndex)
        console.log(totalFiles)

        for (var i = 0; i <= fi.files.length - 1; i++) {
            console.log(fi.files)
            if (i < 10) {
                var fname = fi.files.item(i).name; // THE NAME OF THE FILE.
                var $purchaseItemTemplate;
                var selector = "{index}";
                $purchaseItemTemplate = $("#all_prodcut_tbl_edit").find("[data-purchase-item='template']").clone();
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
                $("#all_prodcut_tbl_edit").find("[data-purchase-list]").append($purchaseItemTemplate);
                $("#srNo_edit" + mainIndex).html(totalFiles+1);
                $("#fileName_edit" + mainIndex).val(fname);
                mainIndex++;
            }
            totalFiles++;
        }
        document.getElementById('Filemessage_edit').innerHTML =
            'Total Files: <b>' + totalFiles + '</b></br >';
    } else {
        $('#Filemessage').text("Drag your files here or click in this area.");
    }
}
