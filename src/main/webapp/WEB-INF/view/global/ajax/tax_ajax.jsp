<script>
    $(document).ready(function () {
        $('#taxnewmodel').formValidation({

            framework: 'bootstrap',
            live: 'disabled',
            excluded: ":disabled",
            button: {
                selector: "#savetaxnew",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                tax: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        }

                    }
                },
                taxrate: {
                    validators: {
                        notEmpty: {
                            message: 'The Tax Rate Is reqired'
                        },
                        regexp: {
                            regexp: /^((\d{0,3})((\.\d{0,2})?))$/,
                            message: 'The TAX Rate can contain only numeric value and not more than two decimal value'
                        },
                        remote: {
                            message: 'This Tax Rate is already exist',
                            url: "/tax/checktax",
                            type: 'POST'
                        }
                    }
                },

            }
        }).on('success.form.fv', function (e) {
            // Prevent form submission
            //alert("name :"+$('#tax').val()+" ::"+$('#rate').val())

            e.preventDefault();//stop the from action methods
            $.post("/tax/savetax", {
                name: $('#tax').val(),
                rate: $('#rate').val()
            }, function (data, status) {
                var option = new Option(data.taxName, data.taxId, true, true);
                $("#tax_id").append(option).trigger('change');
                //$("#tax_id").append('<option value="'+data.taxId+'" s>'+data.taxName+'</option>');

            });
            $('#tax_new_modal').modal('hide');
        });
        $("#savetaxnew").click(function () {
            $('#taxnewmodel').data('formValidation').validate();
            //alert("this is save click");
        });

        $('#tax_new_modal').on('show.bs.modal', function () {
            $('#taxnewmodel').formValidation('resetForm', true);
        });

    });
</script>