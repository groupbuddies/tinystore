$.fn.imageUploadPreview = ->
  @btn = @find('input[type=file]')
  @btn.on 'change', (event) =>
    file = @btn[0].files[0]
    return unless file
    reader = new FileReader()
    reader.onload = (event) =>
      @find('.image-upload-preview').attr('src', event.target.result)
    reader.readAsDataURL(file)
