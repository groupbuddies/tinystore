class Manager::ApplicationController < ::ApplicationController
  before_filter -> { @_theme = :back_end }
end
