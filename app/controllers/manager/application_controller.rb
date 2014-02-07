class Manager::ApplicationController < ::ApplicationController
  before_filter -> { @_theme = :back_end }
  # before_filter :verify_manager

  def current_ability
    @current_ability ||= Ability.new(current_user, current_store)
  end

  protected

  def verify_manager
    redirect_to store_url unless current_user
  end
end
