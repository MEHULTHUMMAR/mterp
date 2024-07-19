<script>
    function getAllCountryAjax(countries) {

        $.get('/location/country',
            function (data, status) {
                $('#' + countries).empty();
                //console.log(data);
                //$("#" + countries).append($('<option>', {value: '', text: "Select Country"}));
                $.each(data, function (key, value) {
                    $("#" + countries).append($('<option>', {value: value.countriesCode, text: value.countriesName,}));
                });
                if ($('#' + countries).data("default") != undefined)
                    $('#' + countries).val($('#' + countries).data("default")).trigger('change');
            });
    }

    function getAllStateAjax(countries, state) {
      
        if($("#" + countries).val()!=null && $("#" + countries).val()!=""){
            $.get('/location/state/' + $("#" + countries).val(),
            function (data, status) {
                $('#' + state).empty();
               // $("#" + state).append($('<option>', {value: '', text: "Select State"}));
                $.each(data, function (key, value) {
                    $("#" + state).append($('<option>', {value: value.stateCode, text: value.stateName,}));
                });
                if ($('#' + state).data("default") != undefined)
                    $('#' + state).val($('#' + state).data("default")).trigger('change');
            });
        }
        
    }

    function getAllCityAjax(state, city) {
        if($("#" + state).val()==null||$("#" + state).val()==""){
            toastr.error("state value null");
        }else{

            $.get('/location/city/' + $("#" + state).val(),
                function (data, status) {
                    $('#' + city).empty();
                  //  $("#" + city).append($('<option>', {value: '', text: "Select City"}));
                    $.each(data, function (key, value) {
                        $("#" + city).append($('<option>', {value: value.cityCode, text: value.cityName,}));
                    });
                    if ($('#' + city).data("default") != undefined)
                        $('#' + city).val($('#' + city).data("default")).trigger('change');

                });

        }
    }


</script>