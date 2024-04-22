<script>
    $(document).ready(function () {
        //alert("ready");

        $('#UomNewMModel').formValidation({
            framework: 'bootstrap',
            live: 'disabled',
            //excluded : ":disabled",
            button: {
                selector: "#SaveUom",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                Uom: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        }

                    }
                },
                UomCode: {
                    validators: {
                        notEmpty: {
                            message: 'The Unit of MeasureMent is reqired'
                        },
                        remote: {
                            message: 'This Code is already exist',
                            url: "/uom/checkuom",
                            type: 'POST'
                        }
                    }
                },
                noOfDecimalPlaces: {
                    validators: {
                        notEmpty: {
                            message: 'The Decimal Places is reqired'
                        },
                        regexp: {
                            regexp: /^[0-4,/d{1}]$/,
                            message: 'The No of Descimal Places can only consist numberical Value O tO 4'
                        }
                    }
                },

            }
        }).on('success.form.fv', function (e) {
            // Prevent form submission
            //alert("name :"+$('#tax').val()+" ::"+$('#rate').val())
            e.preventDefault();//stop the from action methods

            $.post("/uom/saveuom", {
                name: $('#Uom').val(),
                code: $('#Code').val(),
                decimal: $("#Nodp").val(),
            }, function (data, status) {

                var option = new Option(data.measurementName, data.measurementId, true, true);
                $("#uom").append(option).trigger('change');
            });
            $('#m_modal_5').modal('hide');
            $('#UomNewMModel').formValidation('resetForm', true);
            $('#Uom').val("");
            $('#Code').val("");

        });

        $("#SaveUom").click(function () {
            $('#UomNewMModel').data('formValidation').validate();
            //alert("this is save click");
        });

        $('#m_modal_5').on('show.bs.modal', function () {
            $('#UomNewMModel').formValidation('resetForm', true);
            // alert("g");
        });

    });
</script>