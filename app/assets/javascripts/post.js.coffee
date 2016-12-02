# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $(document).ready ->
        $('.tutorial').show();
    return

jQuery ->
    $(document).ready ->
        $('.comment_section').hide();
    return
    
jQuery ->
    $(document).ready ->
        $('.tutorial_close').click ->
            $('.tutorial').slideUp();
        return
    return

jQuery ->
    $(document).ready ->
        $('.comments_link').click ->
            $(this).parent().siblings('.comment_section').slideToggle();
        return
    return