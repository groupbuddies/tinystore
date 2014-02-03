class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_parameters, if: :devise_controller?

  include UrlHelper
  include ThemeHelper

  def after_sign_in_path_for(resource)
    store_url(subdomain: resource.store.slug)
  end

  def after_sign_up_path_for(resource)
    store_url(subdomain: resource.store.slug)
  end

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:name, store_attributes: [:name, :slug, :email, :logo, :description]]
  end
end
