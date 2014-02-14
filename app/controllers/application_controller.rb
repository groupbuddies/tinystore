class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :exit_store, if: :devise_controller?
  before_filter :configure_devise_parameters, if: :devise_controller?
  before_filter :sanitize_cart, if: :is_client?

  include UrlHelper
  include ThemeHelper
  include DeviseHelper
  include CartHelper

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name, store_attributes: [:name, :slug, :email, :logo, :description]]
  end

  def exit_store
    redirect_to url_for(params.merge(subdomain: '')) if current_store.present?
  end

  def sanitize_cart
    current_cart.sanitize
  end
end
