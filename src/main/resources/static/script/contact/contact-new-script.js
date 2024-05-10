/**
 * This File is For Department New Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {
    $("#countriesCode").select2();
    $("#stateCode").select2();
    $("#cityCode").select2();
    //----------Department------------
    $("#contact_new_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#savecontact",
            disabled: "disabled",
        },
        icon: null,
        fields: {
            customerName: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The  customer Name is required.'
                    }
                }
            },mobileNo: {
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
        $("#savecontact").attr("disabled", true);
        $.post("/contact/savecontact", {
            customerName: $('#customerName').val(),
            companyName: $('#companyName').val(),
            mobileNo: $('#mobileNo').val(),
            email: $('#email').val(),
            address: $('#address').val(),
            countriesCode: $('#countriesCode').val(),
            stateCode: $('#stateCode').val(),
            cityCode: $('#cityCode').val(),
            pincode: $('#pincode').val(),
            contactId:0,
        }, function (data, status) {
            toastr["success"]("Record Inserted....");
            $('#contact_new_modal').modal('toggle');
            table.ajax.reload();
			//location.reload(true);
		});
	});

    $('#contact_new_modal').on('shown.bs.modal', function () {
        $('#contact_new_form').formValidation('resetForm', true);
    	$("#customerName").focus();
 	});


    $("#savecontact").click(function () {
        $('#contact_new_form').data('formValidation').validate();
    });

    //----------End Department------------
});
