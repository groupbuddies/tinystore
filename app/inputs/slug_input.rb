class SlugInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge class: 'slug-input'
  end

  def to_html
    input_wrapping do
      label_html <<
      builder.text_field(method, input_html_options) <<
      template.content_tag(:span, options[:domain], class: 'slug-domain')
    end
  end
end
