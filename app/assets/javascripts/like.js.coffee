$(document).on 'ajax:success', 'a.like', (status,data,xhr)->
  # update counter
  $(".likes_count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.like[data-id=#{data.id}]").each ->
    $a = $(this)
    $img = $($a.children()[0])
    toggle_src = $a.data("toggle-src")
    console.log(toggle_src)
    $img.attr('src', toggle_src)
    href = $a.attr 'href'
    $a.attr('href', $a.data('toggle-href'))
    $a.data('toggle-href', href) 
    if toggle_src == "/assets/like-1aeedb4437c2ee1f1f2d3cf168ed58c6b7c59260a582c8c3722d33b7373a5381.png"
        src = "/assets/unlike-c7271b2d6a58a051f1b3780f285d65ecd40119582c1fa9b0c79de083acd3d82b.png"
    else
        src = "/assets/like-1aeedb4437c2ee1f1f2d3cf168ed58c6b7c59260a582c8c3722d33b7373a5381.png"
    console.log(src)
    $a.data('toggle-src', src)
    return

  return