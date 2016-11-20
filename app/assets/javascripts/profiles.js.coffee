# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('.best_in_place').best_in_place()
    
`$(document).ready(function(){
    $("#user_posts_wrap li").click(function () {
        $('.profile_tab').hide().eq($(this).index()).show();  // hide all divs and show the current div
    });
});`