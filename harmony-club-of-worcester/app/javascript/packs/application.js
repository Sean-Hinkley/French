// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery.slick

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("bootstrap/dist/js/bootstrap")
require("jquery")
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("custom/ajax_checkbox")
require("custom/deviseLogIn")
require("custom/events")
require("slick-carousel")
require("custom/contact")



var jQuery = require('jquery')

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;


// change content field to be destination and vice versa
// depending on what page type is selected
document.addEventListener("turbolinks:load", () =>{
// run once to check selected value in selectbox
/*
  $.ajax({
    url: "/auth/site/change_form_fields",
    type: "get",
    data: { type:$("#page_page_type").val()},
    success: function(data) {},
    error: function(data) {}
  });

// checks if the type is changed, and sends call to action that changes form fields
  $("#page_page_type").on("change", function() {
    $.ajax({
     url: "/auth/site/change_form_fields",
     type: "get",
     data: { type:$("#page_page_type").val()},
     success: function(data) {},
     error: function(data) {}
   });

  });
  */

  $.fn.isOnScreen = function(partial){

    //let's be sure we're checking only one element (in case function is called on set)
    var t = $(this).first();
  
    //we're using getBoundingClientRect to get position of element relative to viewport
    //so we dont need to care about scroll position
    var box = t[0].getBoundingClientRect();
  
    //let's save window size
    var win = {
        h : $(window).height(),
        w : $(window).width()
    };
  
    //now we check against edges of element
  
    //firstly we check one axis
    //for example we check if left edge of element is between left and right edge of scree (still might be above/below)
    var topEdgeInRange = box.top >= 0 && box.top <= win.h;
    var bottomEdgeInRange = box.bottom >= 0 && box.bottom <= win.h;
  
    var leftEdgeInRange = box.left >= 0 && box.left <= win.w;
    var rightEdgeInRange = box.right >= 0 && box.right <= win.w;
  
  
    //here we check if element is bigger then window and 'covers' the screen in given axis
    var coverScreenHorizontally = box.left <= 0 && box.right >= win.w;
    var coverScreenVertically = box.top <= 0 && box.bottom >= win.h;
  
    //now we check 2nd axis
    var topEdgeInScreen = topEdgeInRange && ( leftEdgeInRange || rightEdgeInRange || coverScreenHorizontally );
    var bottomEdgeInScreen = bottomEdgeInRange && ( leftEdgeInRange || rightEdgeInRange || coverScreenHorizontally );
  
    var leftEdgeInScreen = leftEdgeInRange && ( topEdgeInRange || bottomEdgeInRange || coverScreenVertically );
    var rightEdgeInScreen = rightEdgeInRange && ( topEdgeInRange || bottomEdgeInRange || coverScreenVertically );
  
    //now knowing presence of each edge on screen, we check if element is partially or entirely present on screen
    var isPartiallyOnScreen = topEdgeInScreen || bottomEdgeInScreen || leftEdgeInScreen || rightEdgeInScreen;
    var isEntirelyOnScreen = topEdgeInScreen && bottomEdgeInScreen && leftEdgeInScreen && rightEdgeInScreen;
  
    return partial ? isPartiallyOnScreen : isEntirelyOnScreen;
  
  };
  
  $.expr.filters.onscreen = function(elem) {
    return $(elem).isOnScreen(true);
  };
  
  $.expr.filters.entireonscreen = function(elem) {
    return $(elem).isOnScreen(true);
  };
  
  $(".navbarDropdown").each(function(){
    if($(this).isOnScreen() == false){
      /*
      $("#dropdownButton").css("display", "block");
      $(".navbar-nav").each(function(){
        $(this).css("margin-top", "1rem");
        $(this).css("flex-direction", "column");
      });
      $("#navbarResponsive").addClass("collapse:not(.show)");
      $("#navbarResponsive").removeClass("navbar-collapse");
      $("#mainNav").css("flex-wrap", "wrap");
      */
      $("#mainNav").removeClass("navbar-expand-lg");
    } 
  });
  function isOverflown(element) {
    return element.scrollHeight > element.clientHeight || element.scrollWidth > element.clientWidth;
  }
  
  // Navbar shrink function
  var navbarShrink = function () {
    const navbarCollapsible = document.body.querySelector('#mainNav');
    if (!navbarCollapsible) {
        return;
    }
    if (window.scrollY === 0) {
        navbarCollapsible.classList.remove('navbar-shrink')
    } else {
        navbarCollapsible.classList.add('navbar-shrink')
    }
  
  };
  
  // Shrink the navbar 
  navbarShrink();
  
  // Shrink the navbar when page is scrolled
  document.addEventListener('scroll', navbarShrink);
  
  // Activate Bootstrap scrollspy on the main nav element
  const mainNav = document.body.querySelector('#mainNav');
  if (mainNav) {
  new bootstrap.ScrollSpy(document.body, {
    target: '#mainNav',
    offset: 72,
  });
  };
  
  // Collapse responsive navbar when toggler is visible
  const navbarToggler = document.body.querySelector('.navbar-toggler');
  const responsiveNavItems = [].slice.call(
    document.querySelectorAll('#navbarResponsive .nav-link')
  );
  responsiveNavItems.map(function (responsiveNavItem) {
    responsiveNavItem.addEventListener('click', () => {
      if (window.getComputedStyle(navbarToggler).display !== 'none') {
        navbarToggler.click();
      }
    });
  });
});



// end AJAX request code
// application.html.erb embedded javascript moved here