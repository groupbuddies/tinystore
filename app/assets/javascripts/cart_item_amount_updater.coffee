$.fn.cartItemAmountUpdater = ->
  @each ->
    @$el = $(@)
    @$item = @$el.closest('.cart-item')
    @$input  = @$el.find('input[type=text]')
    @$total = $(document).find('.cart-total .price')

    @unitary_price = parseFloat(@$el.closest('.cart-item').find('.price').text())

    @increment = ($el, attr, amount, is_float = false) =>
      oldValue = parseFloat($el[attr]())
      newValue = Math.max(0, oldValue + amount)
      newValue = newValue.toFixed(2) if is_float
      $el[attr](newValue)
      $el.trigger('change')

    @update = (inc) =>
      @increment(@$input, 'val', inc)
      @increment(@$total, 'text', @unitary_price*inc, true)
      @$input.trigger('change')

    @submit = =>
      $.ajax(
        type: @$el.find('[name=_method]').val(),
        url: @$el.attr('action'),
        data:
          cart_item:
            amount: @$input.val()
      )

    @$el.find('.plus').on  'click',   => @update(1)
    @$el.find('.minus').on 'click',  => @update(-1)
    @$input.on 'change', => @submit()

$ ->
  $('.js-cart-item-updater').cartItemAmountUpdater()
