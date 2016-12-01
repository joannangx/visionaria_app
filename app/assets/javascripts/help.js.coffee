$(document).on 'ajax:success', 'a.help', (status,data,xhr)->
  # update counter
  $(".helps_count[data-id=#{data.id}]").text data.count

  # toggle links
  $("a.help[data-id=#{data.id}]").each ->
    $a = $(this)
    $img = $($a.children()[0])
    src = $img.attr("src")
    toggle_src = $img.attr("data-toggle-src")
    $img.attr('src', toggle_src)
    $img.attr('data-toggle-src', src)
    href = $a.attr 'href'
    $a.attr('href', $a.data('toggle-href'))
    $a.data('toggle-href', href) 
    return

  return