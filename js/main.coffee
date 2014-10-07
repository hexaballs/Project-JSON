# name = "pitch perfect"
# year = 2012

$ ->
  $('.input').slideDown(1500)

  $('form').submit (e) ->
    e.preventDefault()
    input = $("form input[type='text']")
    name = input.val()
    input.val('')

    $.ajax
      url: "http://www.omdbapi.com/?s=#{name}",
      dataType: "json"
    .done (data) ->
      $('.result').html('')
      for movie in data.Search
        console.log movie.Title
        $('.result').append("<div><a data-imdb='#{movie.imdbID}' href=\"#\">#{movie.Title}</a></div>")

      $('.result > div > a').click (event) ->
        event.preventDefault()
        console.log $(@).data('imdb')

        $.ajax
          url: "http://www.omdbapi.com/?i=#{$(@).data('imdb')}",
          dataType: "json"
        .done (data) ->
          $('.data').slideDown(1500)
          $('h1').html("#{data.Title}")
          $('h2').html(" (#{data.Year}, #{data.Rated})")
          $('.ratings > span').html(data.imdbRating)
          $('.runtime').html(data.Runtime)
          $('.actors > span').html(data.Actors)
          $('.plot').html(data.Plot)
          $('.director > span').html(data.Director)
          $('.writer > span').html(data.Writer)
          $('.country > span').html(data.Country)
          $('.genre > span').html(data.Genre)
          $('.awards > span').html(data.Awards)
          $('.poster').html("<img src=\"#{data.Poster}\">")