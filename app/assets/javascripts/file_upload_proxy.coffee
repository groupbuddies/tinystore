$.fn.fileUploadProxy = ->
  @find('.image-upload-btn').on 'click', (event) ->
    $(this).siblings('input[type=file]').trigger 'click'
