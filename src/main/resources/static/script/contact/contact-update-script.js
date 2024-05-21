/**
 * This File is For Department Update Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {
    $("#editcountriesCode").select2();
    $("#editstateCode").select2();
    $("#editcityCode").select2();
    //----------Department------------
    $("#contact_edit_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#save_edit_contact",
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
       $.post("/contact/savecontact", {
           customerName: $('#editcustomerName').val(),
           companyName: $('#editcompanyName').val(),
           mobileNo: $('#editmobileNo').val(),
           email: $('#editemail').val(),
           contactId:$('#editcontactId').val(),
           address: $('#editaddress').val(),
           countriesCode: $('#editcountriesCode').val(),
           stateCode: $('#editstateCode').val(),
           cityCode: $('#editcityCode').val(),
           pincode: $('#editpincode').val(),

        }, function (data, status) {
            toastr["success"]("Record Inserted....");
            $('#contact_edit_modal').modal('toggle');
           table.ajax.reload();
		});
    });

    $("#save_edit_contact").click(function () {
     $('#contact_edit_form').data('formValidation').validate();
    });
    //----------End Department------------
    $('#contact_edit_modal').on('shown.bs.modal', function () {
        $("#editcustomerName").focus();
        $("#save_edit_contact").prop('disabled',false);

    });

});
