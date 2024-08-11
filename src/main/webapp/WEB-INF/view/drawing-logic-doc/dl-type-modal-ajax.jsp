<script>
    $(document).ready(function () {

        $("#productCategory").select2({
            placeholder: "Search Category",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'productCategory'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`productCategory`)" ' +
                        'class="m-link m--font-boldest">Add Product Category</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) {$(e.element).attr('data-type-code', e.code); return e.full_name || e.text }
        });

        $("#productCapacity").select2({
            placeholder: "Search Capacity",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'productCapacity'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`productCapacity`)" ' +
                        'class="m-link m--font-boldest">Add Product Capacity</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) {
                $(e.element).attr('data-type-code', e.code);
                return e.full_name || e.text }
        });

        $("#orientation").select2({
            placeholder: "Search Orientation",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'orientation'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`orientation`)" ' +
                        'class="m-link m--font-boldest">Add Orientation</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) {$(e.element).attr('data-type-code', e.code); return e.full_name || e.text }
        });

        $("#rawMaterial").select2({
            placeholder: "Search Raw Material",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'rawMaterial'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`rawMaterial`)" ' +
                        'class="m-link m--font-boldest">Add Raw Material</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) { $(e.element).attr('data-type-code', e.code); return e.full_name || e.text }
        });

        $("#rawMaterialType").select2({
            placeholder: "Search Raw MaterialType",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'rawMaterialType'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`rawMaterialType`)" ' +
                        'class="m-link m--font-boldest">Add Raw MaterialType</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) {$(e.element).attr('data-type-code', e.code); return e.full_name || e.text }
        });

        $("#moc").select2({
            placeholder: "Search MOC",
            allowClear: 0,
            ajax: {
                url: "/drawinglogic/list/type/select/json",
                dataType: "json",
                type: "POST",
                delay: 250,
                data: function (e) {
                    return {
                        q: e.term,
                        page: e.page,
                        type:'moc'
                    }
                },
                processResults: function (e, t) { return t.page = t.page || 1, {  results: e.items,  pagination: {   more: 30 * t.page < e.total_count }  } },
                cache: !0
            },
            escapeMarkup: function (e) { return e },
            language: {
                noResults: function () {
                    return '<div class="m-demo-icon"><div class="m-demo-icon__preview"><span class=""><i class="flaticon-plus m--font-primary"></i>' +
                        '</span></div><div class="m-demo-icon__class"><a href="#"  onClick="setDataModal(`moc`)" ' +
                        'class="m-link m--font-boldest">Add MOC</a></div></div>';
                }
            },
            templateResult: function (e) { return e.text },
            templateSelection: function (e) {$(e.element).attr('data-type-code', e.code); return e.full_name || e.text }
        });

        $('#isStd').change(function() {
            $('#stdCode').val('');
            if(this.checked) {
                $('#stdCode').val('STD');
                $('#stdCode').attr('readonly',true);
            }else{
                $('#stdCode').attr('readonly',false);

            }
        });

        $('#isHardwareCode').change(function() {
            $('#hardwareCode').val('');
            if(this.checked) {
                $('#hardwareCode').attr('readonly',false);
            }else{
                $('#hardwareCode').attr('readonly',true);
            }

        });
        //alert("ready");
        $('#isMiscellaneous').change(function() {
            $('#miscellaneousCode').val('');
            if(this.checked) {
                $('#miscellaneousCode').attr('readonly',false);
            }else{
                $('#miscellaneousCode').attr('readonly',true);
            }
        });
        $('#dl_type_form').formValidation({
            framework: 'bootstrap',
            live: 'disabled',
            //excluded : ":disabled",
            button: {
                selector: "#dl_type_save",
                disabled: "disabled",
            },
            icon: null,
            fields: {
                dl_code: {
                    validators: {
                        notEmpty: {
                            message: 'The Code is Required'
                        }
                    }
                },
                dl_name: {
                    validators: {
                        notEmpty: {
                            message: 'The Name is Required'
                        },
                       /* remote: {
                            message: 'This Code is already exist',
                            url: "/uom/checkuom",
                            type: 'POST'
                        }*/
                    }
                },
            }
        }).on('success.form.fv', function (e) {
            e.preventDefault();//stop the from action methods

            $.post("/drawinglogic/save/dltype", {
                dl_name: $('#dl_name').val(),
                dl_code: $('#dl_code').val(),
                dl_type: $("#dl_type").val()
            }, function (data, status) {

                var option = new Option(data.dlTypeCode+' - '+data.dlTypeName, data.drawingLogicTypeId, true, true);
                $("#"+$("#dl_type").val()).append(option).trigger('change');
            });
            $('#dl_type_model').modal('hide');
            $('#dl_type_form').formValidation('resetForm', true);
            $('#dl_name').val("");
            $('#dl_code').val("");

        });

        $("#dl_type_save").click(function () {
            $('#dl_type_form').data('formValidation').validate();
            //alert("this is save click");
        });

        $('#dl_type_model').on('show.bs.modal', function () {
            $('#dl_type_form').formValidation('resetForm', true);
            // alert("g");
        });

    });

    function setDataModal(type){
        $('#dl_type_model').modal('show');
        var title_name='';
        switch (type) {
            case 'productCategory':
                title_name = "New Product Category";
                break;
            case 'productCapacity':
                title_name = "New Product Capacity";
                break;
            case 'orientation':
                title_name = "New Orientation";
                break;
            case 'rawMaterial':
                title_name = "New Raw material";
                break;
            case 'rawMaterialType':
                title_name = "New Raw Material Type";
                break;
            case 'moc':
                title_name = "New MOC";

        }
        $("#dl_type_title").html(title_name);
        $("#dl_type").val(type);
    }

    function generate_DLNumber(){
        var dl_number = 'ND';
        dl_number+= $("#stdCode").val() || 'STD';
        dl_number+= $("#productCategory option:selected").attr('data-type-code') || '';
        dl_number+= $("#productCapacity option:selected").attr('data-type-code') || '';
        dl_number+= $("#orientation option:selected").attr('data-type-code') || '';
        dl_number+= $("#subAssemblyNo").val()|| '';
        dl_number+= $("#partNo").val()|| '';
        dl_number+= $("#processNo").val()|| '';
        dl_number+= $("#revisionNo").val()|| '';

        $("#drawingLogicCode").val(dl_number);
    }


    function generate_RMCode(){
        var dl_number = '';

        dl_number+= $("#rawMaterial option:selected").attr('data-type-code') || '';
        dl_number+= $("#rawMaterialType option:selected").attr('data-type-code') || '';
        dl_number+= $("#moc option:selected").attr('data-type-code') || '';
        dl_number+= $("#size1").val()|| '';
        dl_number+= $("#size2").val()|| '';
        dl_number+= $("#size3").val()|| '';

        $("#rawMaterialCode").val(dl_number);
    }
</script>