# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('.best_in_place').best_in_place()

jQuery ->    
    $(document).ready ->
        $('#tab1').addClass('active');
        $('#my_points').show();
        $('#my_posts').hide();
        $('#my_tagged').hide();
        $('#my_journal').hide();
    return

jQuery ->    
    $(document).ready ->
        $('#tab1').click ->
            $('#my_tagged').hide();
            $('#my_posts').hide();
            $('#my_journal').hide();
            $('#my_points').slideToggle();
        return
    return

jQuery ->    
    $(document).ready ->
        $('#tab2').click ->
            $('#my_tagged').hide();
            $('#my_points').hide();
            $('#my_journal').hide();
            $('#my_posts').slideToggle();
        return
    return

jQuery ->    
    $(document).ready ->
        $('#tab3').click ->
            $('#my_posts').hide();
            $('#my_points').hide();
            $('#my_journal').hide();
            $('#my_tagged').slideToggle();
        return
    return
    
jQuery ->    
    $(document).ready ->
        $('#tab4').click ->
            $('#my_posts').hide();
            $('#my_points').hide();
            $('#my_tagged').hide();
            $('#my_journal').slideToggle();
        return
    return
    
jQuery ->  
    $(document).ready ->
        $('.tab').click ->
            $(this).addClass('active').siblings().removeClass('active');
        return
    return