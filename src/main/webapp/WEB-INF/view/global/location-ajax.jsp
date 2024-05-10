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
                                      
       
    	 console.log("state ajax nnn")
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

    function getAllLocalityAjax(city, locality) {
        console.log("locality");
        $.get('/location/locality/' + $("#" + city).val(),
            function (data, status) {
                $('#' + locality).empty();
                $("#" + locality).append($('<option>', {value: '', text: "Select Locality"}));
                $.each(data, function (key, value) {
                    $("#" + locality).append($('<option>', {value: value.localityId, text: value.localityName,}));
                });
                if ($('#' + locality).data("default") != undefined)
                    $('#' + locality).val($('#' + locality).data("default")).trigger('change');
            });
    }

    const getCurrencyFromCountry = (currencyCallBack) =>{
        $.get('/location/currency/' + $("#countriesCode").val(),
            function (data, status) {
                $('#currencyList').val(data.currencyCode);
                $("#currencyList").select2().trigger('change');
                currencyCallBack(data.currencyName);
            });
    }
</script>