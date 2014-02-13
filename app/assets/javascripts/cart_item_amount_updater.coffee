$.fn.cartItemAmountUpdater = ->
  @url = @attr('action')
  @method = @find('[name=_method]').val()

  @$input  = @find('input[type=text]')
  @$minus = @find('.minus')
  @$plus  = @find('.plus')
  @$total = @closest('.cart').find('.cart-total .price')

  @price = parseFloat(@closest('.cart-item').find('.price').text())

  increment = (amount) =>
    oldValue = @$input.val()
    newValue = oldValue + amount

  @update = (inc) =>
    oldValue = parseInt(@$input.val())
    newValue = Math.max(0, oldValue + inc)
    if newValue != oldValue
      oldTotal = parseFloat(@$total.text())
      newTotal = oldTotal + @price * inc
    @$input.val(newValue)
    @$total.text(newTotal)
    @submit()

  @submit = =>
    $.ajax(
      type: @method,
      url: @url,
      data:
        cart_item:
          amount: @$input.val()
    )

  @$plus.on 'click', =>
    @update(1)
  @$minus.on 'click', =>
    @update(-1)
