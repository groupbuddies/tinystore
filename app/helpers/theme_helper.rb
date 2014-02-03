module ThemeHelper
  def theme(theme)
    @_theme = theme
  end

  def current_theme
    if @_theme
      @_theme
    elsif current_store
      'default'
    else
      'back_end'
    end
  end
end
