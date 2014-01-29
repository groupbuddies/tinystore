module FormHelpers

  def form_submit
    find('[type=submit]').click
  end

  def has_form_errors
    page.should have_css('.inline-errors')
  end

end
