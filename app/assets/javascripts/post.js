// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
   var content_area = $("#content_area");
   var tagged_content = $("#tagged_content");
   var counter     = $("#counter");
   var max_length  = 140;
   
   content_area.keyup(function() {
      counter.text(max_length - $(this).val().length);
   });
   

});