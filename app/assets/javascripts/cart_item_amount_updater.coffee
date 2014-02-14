

$.fn.cartItemAmountUpdater = ->
  @$item = @closest('.cart-item')
  @$input  = @find('input[type=text]')
  @$total = @$item.closest('.cart').find('.cart-total .price')

  @unitary_price = parseFloat(@closest('.cart-item').find('.price').text())

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
      type: @find('[name=_method]').val(),
      url: @attr('action'),
      data:
        cart_item:
          amount: @$input.val()
    )

  @find('.plus').on  'click',   => @update(1)
  @find('.minus').on 'click',  => @update(-1)
  @$input.on 'change', => @submit()
