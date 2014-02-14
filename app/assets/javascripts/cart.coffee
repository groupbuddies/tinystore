$ ->
  $('.js-cart-toggler').on 'click', (event) ->
    event.preventDefault()
    $('.js-cart-window').fadeToggle(250)
