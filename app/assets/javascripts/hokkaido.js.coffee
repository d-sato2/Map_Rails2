ready = ->
  $('.editable').editable
    mode: 'popup'

$(document).ready(ready)
$(document).on('page:load', ready)
