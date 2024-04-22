<script>
    $(document).ready(function () {
        //alert("ready");
        $('#paymentTermForm').formValidation({
            framework: 'bootstrap',
            live: 'disabled',
            excluded: ":disabled",
            button: {
                selector: "#savePaymentTermBtn",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                paymentTermDay: {
                    validators: {
                        notEmpty: {
                            message: 'The Payment Term Day is Required'
                        },
                        regexp: {
                            regexp: /^[0-9- ]+$/,
                            message: 'The Payment Term Day not consist alphabatic value'
                        },

                    }
                },
                paymentTermName: {
                    validators: {
                        notEmpty: {
                            message: 'The Payment Term Name Is reqired'
                        },
                    }
                },

            }
        }).on('success.form.fv', function (e) {
            // Prevent form submission
            //alert("name :"+$('#tax').val()+" ::"+$('#rate').val())
            e.preventDefault();//stop the from action methods
            $.post("/paymentterm/savepaymentterm", {
                name: $('#paymentTermName').val(),
                day: $('#paymentTermDay').val()
            }, function (data, status) {

                toastr["success"]
                ("Record Inserted....");
                //	var option = new Option(data.paymentTermName,
                //			data.paymentTermId, true, true).attr("name",data.paymentTermDay);
                //	$("#paymentTermVo").append(option).trigger('change');

                $("#paymentTermVo").append($('<option>', {
                    value: data.paymentTermId,
                    text: data.paymentTermName,
                    name: data.paymentTermDay
                }));
                $("#paymentTermVo").val(data.paymentTermId).trigger('change');
                $('#paymentTermNewModal').modal('toggle');
                changeDueDate();
            });

            $('#paymentTermForm').formValidation('resetForm', true);
            $('#paymentTermName').val("");
            $('#paymentTermDay').val("");

        });

        $('#paymentTermNewModal').on('show.bs.modal', function () {

            $('#paymentTermForm').formValidation('resetForm', true);

        });


        $("#savePaymentTermBtn").click(function () {

            $('#paymentTermForm').data('formValidation').validate();

        });


    });
</script>