/**
 * This File is For Department Update Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {

    //----------Department------------
    $("#coupon_edit_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#updatedepartment",
            disabled: "disabled",
        },
        icon: null,
        fields: {
             description_edit_model: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The  Description Or Product name is required.'
                    }
                }
            },points_edit_model: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The Points is required. '
                    }
                }
            }
        }
    }).on('success.form.fv', function (e) {
        e.preventDefault();//stop the from action methods
        $("#updatedepartment").attr("disabled", true);
       $.post("/coupon/updatecoupon", {
			couponId: $('#coupon_id').val(),
            couponType: $('#coupon_type_edit_model').val(),
			discount: $('#discount_edit_model').val(),
			points: $('#points_edit_model').val(),
			description: $('#description_edit_model').val(),
			discountType: $('#discount_type_edit_model').val(),
            otpverify: $('#editotpverify').val(),

        }, function (data, status) {
            toastr["success"]("Record Inserted....");
            $('#coupon_edit_modal').modal('toggle');
			location.reload(true);
		});
    });

    $("#save_edit_coupon").click(function () {
     $('#coupon_edit_form').data('formValidation').validate();
    });
    //----------End Department------------
    $('#coupon_edit_modal').on('shown.bs.modal', function () {
        $("#points_edit_model").focus();
        $('#coupon_edit_form').reset();
    });

});
