$.fn.registrationWizard = ->
  @steps
    headerTag: 'fieldset legend'
    bodyTag: 'fieldset'
    enablePagination: false
    titleTemplate: '<span class="step-name">#title#</span><span class="step-number">#index#</span>'
    labels:
      current: ''
