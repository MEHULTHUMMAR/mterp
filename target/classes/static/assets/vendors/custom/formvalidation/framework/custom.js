$(document).ready(function () {

    //if you wish to keep both the divs hidden by default then dont forget to hide //them           
    $("#productTable").hide();


    /*$("#table2").hide();
    $("#table3").hide();

   $("#anchor-link").click(function(){
         
         $("#table1").show();
         $("#table2").hide();
          $("#table3").hide();
    });
   $("#anchor-link1").click(function(){
         
         $("#table2").show();
        $("#table1").hide();  
        $("#table3").hide();
    });
   $("#anchor-link2").click(function(){
         
         $("#table3").show();
        $("#table1").hide();  
        $("#table2").hide();
    });*/

});


$('#ui-tabs').tabs();

function GetSelectedTabIndex() {
    return $('#ui-tabs').tabs('option', 'selected');
}

function ShowTabs(stepNum) {
    var num = parseInt(stepNum);
    $('#ui-tabs').tabs('option', 'active', parseInt(GetSelectedTabIndex()) + num);
}

$('#prev, #next').click(function () {
    ShowTabs(this.value);
})

alert(GetSelectedTabIndex())