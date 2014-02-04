class PriceInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge class: 'price-input'
  end

  def to_html
    input_wrapping do
      label_html <<
      builder.text_field(method, input_html_options)
    end
  end
end
