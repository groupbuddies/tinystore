$.fn.registrationWizard = ->
  @$object = $(this)
  wizard = @$object.steps
    headerTag: 'fieldset legend'
    bodyTag: 'fieldset'
    enablePagination: false
    titleTemplate: '<span class="step-name">#title#</span><span class="step-number">#index#</span>'
    labels:
      current: ''

  @$object.find('.js-step-next').on 'click', (event) =>
    console.log 'asd'
    debugger
    event.preventDefault()
    @$object.next()

  @$object.find('.js-step-previous').on 'click', (event) =>
    event.preventDefault()
    @$object.previous()

