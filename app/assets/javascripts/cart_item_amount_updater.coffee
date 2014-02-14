$.fn.cartItemAmountUpdater = ->
  @each ->
    @$el = $(@)
    @$item = @$el.closest('.cart-item')
    @$input  = @$el.find('input[type=text]')
    @$total = @$item.closest('.cart').find('.cart-total .price')

    @unitary_price = parseFloat(@$el.closest('.cart-item').find('.price').text())

    @increment = ($el, attr, amount, is_float = false) =>
      oldValue = parseFloat($el[attr]())
      newValue = Math.max(0, oldValue + amount)
      newValue = newValue.toFixed(2) if is_float
      $el[attr](newValue)
      $el.trigger('change')

    @increment_total = (inc) =>
      @increment(@$total, 'text', @unitary_price*inc, true)

    @update = (inc) =>
      @increment(@$input, 'val', inc)
      @increment_total(inc)
      @$input.trigger('change')

    @submit = =>
      $.ajax(
        type: @$el.find('[name=_method]').val(),
        url: @$el.attr('action'),
        data:
          cart_item:
            amount: @$input.val()
      )

    @$input.data('old-value', @$input.val())

    @$el.find('.plus').on  'click',   => @update(1)
    @$el.find('.minus').on 'click',  => @update(-1)
    @$input.on 'change', =>
      newValue = parseInt(@$input.val())
      inc = newValue - parseInt(@$input.data('old-value'))
      @increment_total(inc)
      @$input.data('old-value', newValue)
      @submit()

$ ->
  $('.js-cart-item-updater').cartItemAmountUpdater()
