$ ->
  $.ajax
    url: "http://ip.jsontest.com/"
  .done ->
    console.log "Success"