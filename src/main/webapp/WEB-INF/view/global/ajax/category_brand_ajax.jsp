<script>
    $(document).ready(function () {
        //alert("ready");
        $('#categorynewmodel').formValidation({
            framework: 'bootstrap',
            // excluded: ":disabled",
            button: {
                selector: "#savecategory",//"#savepredefineproductattribute",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                category: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        },remote: {
                            message: 'This Category is already exist. ',
                            url: "/categorybrand/checkcategory",
                            type: 'POST'
                        }
                    }
                }
            }
        }).on('success.form.fv', function (e) {
            // Prevent form submission
            var parents;
            if ($("#maincategory").val() == '') {
                parents = 0;
            } else {
                parents = $("#maincategory").val();
            }
            e.preventDefault();//stop the from action methods
            $.post("/categorybrand/savecategory", {
                name: $('#category').val(),
                code: $("#code").val(),
                description: $('#description').val(),
                department: $("#department").val(),
                parent: parents
            }, function (data, status) {

                var option = new Option(data.categoryName,
                    data.categoryId, true, true);

                $("#category_id").append(option).trigger(
                    'change');

//			$("#maincategory").append(option);

            });
            $('#category_new_model').modal('hide');
            $('#categorynewmodel').formValidation('resetForm',
                true);
            $('#category').val("");
            $('#description').val("");
        });

        $('#brandnewmodel').formValidation({
            framework: 'bootstrap',
           /*  live: 'disabled',
            excluded: ":disabled", */
            button: {
                selector: "#savebrand",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                brandname: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        },
                        remote: {
                            message: 'This Name is already exist',
                            url: "/categorybrand/checkbrand",
                            type: 'POST'
                        }

                    }
                },
                brandcode: {
                    validators: {
                        notEmpty: {
                            message: 'The Code is Required'
                        },

                    }
                },
                branddesc: {
                    validators: {
                        stringLength: {
                            max: 50,
                            message: 'The description must be less than 50 characters long'
                        },
                    }
                },

            }
        }).on('success.form.fv', function (e) {
            // Prevent form submission
            var parents;
            if ($("#mainbrand").val() == '') {
                parents = 0;
            } else {
                parents = $("#mainbrand").val();
            }
            e.preventDefault();//stop the from action methods
            $.post("/categorybrand/savebrand", {
                name: $('#brandname').val(),
                code: $('#brandcode').val(),
                description: $('#branddescription').val(),
                parent: parents
            }, function (data, status) {

                var option = new Option(data.brandName,
                    data.brandId, true, true);
                $("#brand").append(option).trigger('change');
            });
            $('#m_modal_6').modal('hide');
            $('#brandnewmodel').formValidation('resetForm',
                true);
            $('#brandname').val("");
            $('#branddescription').val("");

        });

        /* brand update validation finish */
        $("#savecategory").click(function () {
            $('#categorynewmodel').data('formValidation').validate();
        });

        $('#m_modal_6').on('show.bs.modal', function () {
            $('#brandnewmodel').formValidation('resetForm', true);
        });

        $('#category_new_model').on('show.bs.modal', function () {
            $('#categorynewmodel').formValidation('resetForm', true);
        });

        $("#savebrand").click(function () {
            //alert("sds");
            $('#brandnewmodel').data('formValidation').validate();
        });

    });
</script>