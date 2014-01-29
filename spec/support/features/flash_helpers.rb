module FlashHelpers
  def has_flash(type = nil)
    type_class = ".#{type.to_s}" if type
    page.should have_css ".flash#{type_class}"
  end

  def has_error_flash
    has_flash(:error)
  end

  def has_notice_flash
    has_flash(:notice)
  end
end
