/**
 * This File is For Department New Modal
 * Department Ajax Insert
 * Department Validation
 */

$(document).ready(function () {

    //----------Department------------
    $("#coupon_new_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#savecoupon",
            disabled: "disabled",
        },
        icon: null,
        fields: {
            description_new_model: {
                verbose: false,
                validators: {
                    notEmpty: {
                        message: 'The  Description Or Product name is required.'
                    }
                }
            },points_new_model: {
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
        $("#savecoupon").attr("disabled", true);
        $.post("/coupon/savecoupon", {
            couponType: $('#coupon_type_new_model').val(),
			discount: $('#discount_new_model').val(),
			points: $('#points_new_model').val(),
			description: $('#description_new_model').val(),
			discountType: $('#discount_type_new_model').val(),
            otpverify: $('#otpverify').val(),

        }, function (data, status) {
            toastr["success"]("Record Inserted....");
            $('#coupon_new_modal').modal('toggle');
			location.reload(true);
		});
	});

    $('#coupon_new_modal').on('shown.bs.modal', function () {
        $('#coupon_new_form').formValidation('resetForm', true);
    	$('#typeswitch').prop('checked', true).change();    
		$("#points_new_model").focus();
 	});

	$('#coupon_new_modal').on('show.bs.modal', function () {
			btnamount('_new_model');
		$('#typeswitch').prop('checked', false).change();  	
		});

    $("#savecoupon").click(function () {
        $('#coupon_new_form').data('formValidation').validate();
    });

    //----------End Department------------
 		$('#btn_percentage_new_model').click(function () {
            $('#btn_percentage_new_model').slideUp();
            $('#btn_amount_new_model').slideDown();
            $("#discount_type_new_model").val('amount');
            $("#discount_new_model").attr("placeholder", 'Amount');
          
        });
        $('#btn_amount_new_model').click(function () {
            $('#btn_percentage_new_model').slideDown();
            $('#btn_amount_new_model').slideUp()
            $("#discount_type_new_model").val('percentage');
            $("#discount_new_model").attr("placeholder", 'Percentage');
            var discount = $("#discount_new_model").val();
            if (parseFloat(discount) > 100) {
                $("#discount_new_model").val("100");
            }
           
        });
		

});
