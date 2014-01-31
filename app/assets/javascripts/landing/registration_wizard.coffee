$.fn.registrationWizard = ->
  @steps
    headerTag: 'fieldset legend'
    bodyTag: 'fieldset'
    enablePagination: false
    titleTemplate: '<span class="step-name">#title#</span><span class="step-number">#index#</span>'
    labels:
      current: ''
    onStepChanging: (event, currentIndex, newIndex) =>
      console.log currentIndex
      if currentIndex == 0
        $user_mail = @find('#user_email')
        $store_mail = @find('#user_store_email')
        $store_mail.val($user_mail.val()) if $store_mail.is(':empty')
      true
