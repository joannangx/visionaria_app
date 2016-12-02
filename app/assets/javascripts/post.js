// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
   var post_content = $("#post_content");
   var tagged_content = $("#tagged_content");
   var counter     = $("#counter");
   var max_length_post  = 140;
   var max_length_tagged  = 280;
   
   post_content.keyup(function() {
      counter.text(max_length_post - $(this).val().length);
   });
   tagged_content.keyup(function() {
      counter.text(max_length_tagged - $(this).val().length);
   });
   

});