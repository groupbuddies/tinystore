module DeviseRegistrationsControllerDecorator
  extend ActiveSupport::Concern

  included do
    alias :devise_new :new
    def new; custom_new; end
  end

  def custom_new
    build_resource({})
    resource.build_store
    respond_with self.resource
  end
end

Devise::RegistrationsController.send(:include, DeviseRegistrationsControllerDecorator)
