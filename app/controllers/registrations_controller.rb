class RegistrationsController < Devise::RegistrationsController

  def new
    @registration = RegistrationForm.new
  end

  def create
    @registration = RegistrationForm.new(registration_params)

    if @registration.save
      user = @registration.user
      if user.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(:user, user)
        respond_with user, location: after_sign_up_path_for(user)
      else
        set_flash_message :notice, :"signed_up_but_#{user.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with user, location: after_inactive_sign_up_path_for(user)
      end
    else
      # clean_up_passwords @registration.user
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration_form).permit(RegistrationForm.attributes)
  end
end
