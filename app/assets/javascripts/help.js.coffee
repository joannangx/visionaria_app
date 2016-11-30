$(document).on 'ajax:success', 'a.help', (status,data,xhr)->
  # update counter
  $(".helps_count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.help[data-id=#{data.id}]").each ->
    $a = $(this)
    $img = $($a.children()[0])
    href = $a.attr 'href'
    toggle_src = $a.data("toggle-src")
    $img.attr('src', toggle_src)
    if toggle_src is "help.png"
        src = "unhelp.png"
    else
        src = "help.png"
    $a.data('toggle-src', src)
    $a.attr('href', $a.data('toggle-href'))
    $a.data('toggle-href', href) 
    return

  return