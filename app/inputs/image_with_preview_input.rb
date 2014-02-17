class ImageWithPreviewInput < Formtastic::Inputs::FileInput
  def to_html
    input_wrapping do
      label_html <<
      template.content_tag(:div) do
        template.raw([
          image_preview,
          template.content_tag(:div, class: 'image-upload-right-panel') do
            template.raw([hint, submit_button, hidden_file_input].join)
          end
        ].join)
      end
    end
  end

  def hint?
    false
  end

  private

  def hidden_file_input
    builder.file_field(method, input_html_options)
  end

  def image_preview
    template.content_tag(:div, class: 'image-upload-preview-container') do
      template.image_tag object.public_send(method).url(:preview), class: 'image-upload-preview'
    end
  end

  def hint
    template.content_tag(
      :p,
      Formtastic::Util.html_safe(hint_text),
      class: options[:hint_class] || builder.default_hint_class
    )
  end

  def submit_button
    template.link_to('Upload', '#', class: 'image-upload-btn')
  end
end
