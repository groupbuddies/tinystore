class RegistrationForm < FormObject::Base
  dont_use_model

  attributes :name, :email, :password, :password_confirmation

  validates_presence_of attributes

  attr_reader :user

  def save
    @user ||= User.new(user_attributes)
    if @user.valid? && valid?
      @user.save
    end
  end

  def errors
    final_errors = super
    if @user
      final_errors.each { |error| @user.errors.add(*error) }
      final_errors = @user.errors
    end
    final_errors
  end

  def user_attributes
    attributes.slice(:name, :email, :password, :password_confirmation)
  end
end
