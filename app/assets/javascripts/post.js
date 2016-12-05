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

jQuery(function() {
  $(document).ready(function() {
    return $('.tutorial').show();
  });
});

jQuery(function() {
  $(document).ready(function() {
    $('.tutorial_close').click(function() {
      return $('.tutorial').slideUp();
    });
  });
});

jQuery(function() {
  $(document).ready(function() {
    return $('.comment_section').hide();
  });
});

jQuery(function() {
  $(document).ready(function() {
    $('.comments_link').on('click', function() {
      return $(this).parent().parent().siblings('.comment_section').slideToggle();
    });
  });
});

jQuery(function() {
  $(document).ready(function() {
    return $('.edit_content').hide();
  });
});