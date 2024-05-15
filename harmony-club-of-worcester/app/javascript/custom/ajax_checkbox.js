/*!
* Start Bootstrap - Freelancer v7.0.4 (https://startbootstrap.com/theme/freelancer)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-freelancer/blob/master/LICENSE)
*/
//
// Scripts
// 

document.addEventListener('turbolinks:load', () => {

    $('#checkbox input[type="checkbox"]').click(function() {
      $.ajax({
        url: window.location.href,
        type: "GET",
        data: { roleName: $(this).val(), roleValue: $(this).is(":checked") },
        success: function(data) {},
        error: function(data) {}
      })
    });
  
    $("#permission_permissible_type").change(function() {
      console.log("FIRST AJAX REQUEST!");
      $.ajax({
        async: false,
        url: "/auth/site/change_permissibles",
        type: "GET",
        data: { type: $("#permission_permissible_type").val() },
        success: function(data) {},
        error: function(data) {}
      })
    });
    var allRecords = document.getElementById("permission_allRecords").checked;
    $("#permission_allRecords").change(function(){
      allRecords = !allRecords
      $.ajax({
        url: "/auth/site/change_permissible_id",
        type: "GET",
        data: {checked: allRecords},
        success: function(data) {},
        error: function(data) {}
      })
      console.log("SECOND AJAX REQUEST!");
      $.ajax({
        url: "/auth/site/change_permissibles",
        type: "GET",
        data: { type: $("#permission_permissible_type").val() },
        success: function(data) {},
        error: function(data) {}
      })
    });
    $.ajax({
      url: "/auth/site/change_permissible_id",
      type: "GET",
      data: {checked: allRecords},
      success: function(data) {},
      error: function(data) {}
    })
    console.log("THIRD AJAX REQUEST!");
    $.ajax({
      url: "/auth/site/change_permissibles",
      type: "GET",
      data: { type: $("#permission_permissible_type").val() },
      success: function(data) {},
      error: function(data) {}
    })
});

