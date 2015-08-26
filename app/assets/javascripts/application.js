// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {

  $(function() {
    $('.book-rating').click(function() {
      var stars = $(this).attr('data-stars');

      for(var i=1; i<=10; i++) {
        if (i<= stars) {
          $('#' +  i).removeClass("glyphicon-star-empty").addClass("glyphicon-star");
        } else {
          $('#' +  i).removeClass("glyphicon-star").addClass("glyphicon-star-empty");        
        }
      }

      $("#stars-form").val(stars);

      $.ajax({
        type: "get",
        data: $("#stars-form").attr('action'),
        data: $("#stars-form").serialize()
      });
    });
  });
});
