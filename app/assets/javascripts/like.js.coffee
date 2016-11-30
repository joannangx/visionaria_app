$(document).on 'ajax:success', 'a.like', (status,data,xhr)->
  # update counter
  $(".likes_count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.like[data-id=#{data.id}]").each ->
    $a = $(this)
    $img = $($a.children()[0])
    toggle_src = $a.data("toggle-src")
    $img.attr('src', toggle_src)
    href = $a.attr 'href'
    $a.attr('href', $a.data('toggle-href'))
    $a.data('toggle-href', href) 
    if toggle_src is "/assets/like.png"
        src = "/assets/unlike.png"
    else
        src = "/assets/like.png"
    $a.data('toggle-src', src)
    return

  return