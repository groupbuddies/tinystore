class RegistrationForm < FormObject::Base
  dont_use_model

  attributes :name, :email, :password, :password_confirmation

  validates_presence_of attributes

  attr_reader :user

  def save
    @user ||= User.new(user_attributes)
    if valid?
      @user.save
    end
  end

  def errors
    final_errors = super
    if @user
      @user.errors.each { |error| final_errors.add(*error) }
    end
    final_errors
  end

  def user_attributes
    attributes.slice(:name, :email, :password, :password_confirmation)
  end
end
