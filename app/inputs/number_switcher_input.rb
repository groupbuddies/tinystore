class NumberSwitcherInput < Formtastic::Inputs::NumberInput
  def to_html
    input_wrapping do
      minus_btn << input_txt << plus_btn
    end
  end

  private

  def minus_btn
    template.content_tag :span, class: 'minus'
  end

  def plus_btn
    template.content_tag :span, class: 'plus'
  end

  def input_txt
    builder.text_field
  end

  def hidden_file_input
    builder.file_field(method, input_html_options)
  end

  def image_preview
    template.image_tag object.public_send(method).url(:preview), class: 'image-upload-preview'
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
