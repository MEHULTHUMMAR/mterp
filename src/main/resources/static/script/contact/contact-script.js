/**
 *
 */
var firstNameValidatorold = {
        validators: {
            notEmpty: {
                message: 'The first name is required'
            },
            stringLength: {
                max: 75,
                message: 'The first name must be less than 75 characters long'
            },
            regexp: {
                regexp: /^[a-zA-Z0-9_@$-\s-., ]+$/,
                message: 'The First Name can only consist of alphabetical, number , underscore, at sign and dollar. '
            }
        }
    },
    lastNameValidator = {
        validators: {
            notEmpty: {
                message: 'The last name is required'
            },
            stringLength: {
                max: 50,
                message: 'The last name must be less than 50 characters long'
            },
            regexp: {
                regexp: /^[a-zA-Z0-9_@$-\s-., ]+$/,
                message: 'The Last Name can only consist of alphabetical, number , underscore, at sign and dollar. '
            }
        }
    },

    companyNameValidator = {
        validators: {
            stringLength: {
                max: 75,
                message: 'The company name must be less than 75 characters long'
            },
            regexp: {
                regexp: /^[a-zA-Z0-9\s!#$%&;*+,.?@\[\]\\^_{}|`]+$/,
                message: 'The Company Name can only consist of only consist of alphanumeric and all special character except \"<>/\':-=()~'
            }
        }
    },
    addressValidator = {
        validators: {
            stringLength: {
                max: 250,
                message: 'The address must be less than 250 characters long'
            }
        }
    },
    mobNoValidator = {
        validators: {
            /*stringLength: {
                max: 15,
                min: 10,
                message: 'Mobile no should be between 10-15 digit'
            },*/
			callback: {
                message: 'Mobile number not Valid',
                callback: function(value, validator, $field) {
                    // Define the minimum length based on the prefix
                    var pattern91 = /^[6-9]\d{9}$/;
					var patternOther = /^[1-9]\d{2,14}$/;
                    if($("#countryDialCodePrefix").val() === '91') {
                   		return pattern91.test(value) 
                   	}else{ 
                   		return patternOther.test(value);
                    }
                }
            },
            regexp: {
                regexp: /^[0-9+]+$/,
                message: 'The mobile no can only consist of number'
            },
            /*regexp: {
                regexp: /^[6-9]\d{9}$/,
                message: 'mobile number not Valid'
            }*/
        }
    },
    countriesCodeValidator = {
        validators: {
            notEmpty: {
                message: 'select country'
            }
        }
    },
    stateCodeValidator = {
        validators: {
            notEmpty: {
                message: 'select state'
            }
        }
    },
    cityCodeValidator = {
        validators: {
            notEmpty: {
                message: 'select city'
            }
        }
    },
    pinCodeValidator = {
        validators: {
            stringLength: {
                max: 50,
                message: 'The ZIP/Postal code can only consist of Fifty digit'
            },

        }
    };

$(document).ready(function () {

    $("#address_repeater").repeater({
        initEmpty: false,
        isFirstItemUndeletable: true,
        show: function () {

            $(this).find(".select2-container").remove();
            index = $(this).index();

            $(this).find("select.m-select2").each(function () {

                $(this).removeAttr("data-select2-id");
                $(this).removeAttr("aria-hidden");
                $(this).removeAttr("tabindex");
                $(this).removeClass("select2-hidden-accessible");

                placeholder = "Select...";
                if ($(this).attr("placeholder")) {
                    placeholder = $(this).attr("placeholder");
                }

                allowClear = 0;
                if ($(this).data('allow-clear')) {
                    allowClear = !0;
                }
                $(this).select2({placeholder: placeholder, allowClear: allowClear});

            });

            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].companyName", companyNameValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].phoneNo", mobNoValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].countriesCode", countriesCodeValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].stateCode", stateCodeValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].cityCode", cityCodeValidator);

            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].pinCode", pinCodeValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].addressLine1", addressValidator);
            $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].addressLine2", addressValidator);

            $('#contactAddressId' + index).val("0");
            $('#defaultAddress' + index).val("0");
            getAllCountryAjax("countriesCode" + index);

            $("#localityCode" + index).select2({
                placeholder: "Search Locality",
                allowClear: 0,
                escapeMarkup: function (markup) {
                    return markup;
                },
                language: {
                    noResults: function () {
                        return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i></span></div><div class="m-demo-icon__class"><a href="#" data-toggle="modal" onClick="setLocalityModal(' + index + ')"class="m-link m--font-boldest">Add Locality</a></div></div>';
                    }
                },
            });

            $("#cityCode" + index).select2({
                placeholder: "Search Locality",
                allowClear: 0,
            });
            $(this).slideDown();
        },
        hide: function (e) {
            index = $(this).index();

            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].companyName");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].phoneNo");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].countriesCode");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].stateCode");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].cityCode");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].localityCode");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].pinCode");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].addressLine1");
            $('#contact_form').formValidation('removeField', "contactAddressVos[" + index + "].addressLine2");

            if ($("#deleted-address").val() != undefined) {

                if ($(this).find("[id^='contactAddressId']").val()!=undefined &&
                	$(this).find("[id^='contactAddressId']").val()!=null &&
                	$(this).find("[id^='contactAddressId']").val() != '') {
                    $("#deleted-address").val($("#deleted-address").val() + $(this).find("[id^='contactAddressId']").val() + ",");
                }
            }

            $(this).remove()
        },

        ready: function (setIndexes) {
            /* $dragAndDrop.on('drop', setIndexes); */
        },

    });

    $('#contact_form').formValidation({
        framework: 'bootstrap',
        excluded: ":disabled",
        /*live:'disabled', */
        button: {
            selector: "#save_contact",
            disabled: "disabled"
        },
        icon: null,
        fields: {
            Name: {
                validators: {
                    stringLength: {
                        max: 50,
                        message: 'The first name must be less than 50 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_@$-\s-., ]+$/,
                        message: 'The First Name can only consist of alphabetical, number , underscore, at sign and dollar .'
                    }
                }
            },

            companyName: {
                validators: {
                    stringLength: {
                        max: 75,
                        message: 'The company name must be less than 75 characters long'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_@$-\s-., ]+$/,
                        message: 'only consist of alphabets,dot,number,comma, underscore, at sign and dollar. '
                    }
                }
            },
            mobNo: {
                validators: {
                    stringLength: {
                        max: 15,
                        min: 10,
                        message: 'The mobile must be between 10-15 digits.'
                    },
                    remote: {
                        message: 'This Mobile Number is already exist. ',
                        url: "/contact/checkmobilenumber",
                        type: 'POST',
                        data: function (validator, $field, value) {
                            var id = $("input[name=contactId]").val();
                            //  alert(id ? id : '0')
                            return {
                                contactId: id ? id : '0'
                            };
                        },
                    },
                    regexp: {
                        regexp: /^[0-9+]+$/,
                        message: 'The mobile no. can only consist of number'
                    },
                }
            },

            email: {
                verbose: false,
                validators: {
					stringLength: {
                        max: 50,
                        message: 'Email Address Should not be greater than 50'
                    },
                    regexp: {
                        //regexp: /^[a-z|A-Z|]+([\.|-]?[a-z|A-Z|0-9|_]+)*@[a-z|A-Z]+[a-z|A-Z|0-9]*[\\.]+[a-z|A-Z]+([.]?[a-z|A-Z]+)$/,
                        regexp : /^(?!.*[^A-Za-z0-9]{2})[A-Za-z0-9]{1,3}\.*(?=[A-Za-z][a-zA-Z0-9@._-]{5,50}$)[a-zA-Z0-9._-]{1,40}@(?:(?=[a-zA-Z][a-zA-Z0-9-]{1,17}\.)[a-zA-Z0-9]+(?:-[a-zA-Z0-9]+)*\.){1,2}[a-zA-Z]{2,6}$/,
                        //regexp : /^(?!.*[^A-Za-z0-9]{2})[A-Za-z0-9]\.*(?=[a-z][a-z0-9@._-]{5,50}$)[a-z0-9._-]{1,40}@(?:(?=[a-zA-Z][a-z0-9-]{1,15}\.)[a-z0-9]+(?:-[a-z0-9]+)*\.){1,2}[a-z]{2,6}$/,
                		message: 'email address is not a valid'
                    }
                }
            },
        }
    });


    $("#address_repeater").find("[data-repeater-item]").each(function () {

        index = $(this).index();

        $(this).find("select.m-select2").each(function () {
            $(this).removeAttr("data-select2-id");
            $(this).removeAttr("aria-hidden");
            $(this).removeAttr("tabindex");
            $(this).removeClass("select2-hidden-accessible");

            placeholder = "Select...";
            if ($(this).attr("placeholder")) {
                placeholder = $(this).attr("placeholder");
            }

            allowClear = 0;
            if ($(this).data('allow-clear')) {
                allowClear = !0;
            }
            $(this).select2({placeholder: placeholder, allowClear: allowClear});

        });
        getAllCountryAjax("countriesCode" + index);

        //$('#contact_form').formValidation('addField',"contactAddressVos["+index+"].firstName", firstNameValidator);
        //$('#contact_form').formValidation('addField',"contactAddressVos["+index+"].lastName", lastNameValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].companyName", companyNameValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].phoneNo", mobNoValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].countriesCode", countriesCodeValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].stateCode", stateCodeValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].cityCode", cityCodeValidator);

        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].pinCode", pinCodeValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].addressLine1", addressValidator);
        $('#contact_form').formValidation('addField', "contactAddressVos[" + index + "].addressLine2", addressValidator);
        $("#localityCode" + index).select2({
            placeholder: "Search Locality",
            allowClear: 0,
            escapeMarkup: function (markup) {
                return markup;
            },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i></span></div><div class="m-demo-icon__class"><a href="#" data-toggle="modal" onClick="setLocalityModal(' + index + ')"class="m-link m--font-boldest">Add Locality</a></div></div>';
                }
            },
        });


        $("#cityCode" + index).select2({
            placeholder: "Search Locality",
            allowClear: 0,
        });

        $(document).on('keyup', '.select2-search__field', function (e) {
            if (e.which === 13) {
                if ($('#select2-contactVo-results li select2-results__option').length == 0) {
                    if ($("#localityCode" + index).data('select2').isOpen()) {
                        setLocalityModal(index);
                    }
                    if ($("#cityCode" + index).data('select2').isOpen()) {
                        setCityModal(index);
                    }
                }
            }
        });
    });
});

    $("#save_contact").click(function () {
        $('#save_contact').prop('disabled', true);
        if ($('#contact_form').data('formValidation').isValid() == null) {
            $('#contact_form').data('formValidation').validate();

        }
        if ($('#contact_form').data('formValidation').isValid() == true) {
            let allowSubmit = true;
            if(allowSubmit) {

                document.getElementById("contact_form").submit();
            } else {
				$('#save_contact').prop('disabled', false);
      		}
        }else{
            $('#save_contact').prop('disabled', false);
        }
    });

function check(e, c) {

    var allowedKeyCodesArr = [9, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 8, 37, 39, 109, 189, 46, 110, 190];  // allowed keys
    if ($.inArray(e.keyCode, allowedKeyCodesArr) === -1) {  // if event key is not in array and its not Ctrl+V (paste) return false;
        e.preventDefault();
    } else if ($.trim($(c).val()).indexOf('.') > -1 && $.inArray(e.keyCode, [110, 190]) !== -1) {  // if float decimal exists and key is not backspace return fasle;
        e.preventDefault();
    } else {
        return true;
    }
}
