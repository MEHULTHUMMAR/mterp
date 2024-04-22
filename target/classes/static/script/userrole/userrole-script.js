/**
 * This File is For Terms and condition New Modal
 * Tax Ajax Insert
 * Tax Validation
 */

$(document).ready(function () {
    $("#userrole_new_form").formValidation({
        framework: 'bootstrap',
        live: 'disabled',
        excluded: ":disabled",
        button: {
            selector: "#saveuserrole",
            disabled: "disabled",
        },
        icon: null,
        fields: {
            userRoleName: {
                validators: {
                    notEmpty: {
                        message: 'The User Role is required. '
                    }
                }
            }
        }
    });

});