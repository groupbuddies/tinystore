class NumberSpinnerInput < Formtastic::Inputs::NumberInput
  def to_html
    input_wrapping do
      minus_btn << input << plus_btn
    end
  end

  private

  def minus_btn
    template.content_tag :a, '-', class: 'minus', href: '#'
  end

  def plus_btn
    template.content_tag :a, '+', class: 'plus', href: '#'
  end

  def input
    builder.text_field(method, input_html_options)
  end
end
