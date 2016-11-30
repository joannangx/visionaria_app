$(document).on 'ajax:success', 'a.inspire', (status,data,xhr)->
  # update counter
  $(".inspires_count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.inspire[data-id=#{data.id}]").each ->
    $a = $(this)
    $img = $($a.children()[0])
    href = $a.attr 'href'
    toggle_src = $a.data("toggle-src")
    $img.attr('src', toggle_src)
    if toggle_src is "assets/inspire.png"
        src = "assets/uninspire.png"
    else
        src = "assets/inspire.png"
    $a.data('toggle-src', src)
    $a.attr('href', $a.data('toggle-href'))
    $a.data('toggle-href', href) 
    return

  return