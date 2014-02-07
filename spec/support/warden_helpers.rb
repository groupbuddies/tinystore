module WardenHelpers
  include Warden::Test::Helpers

  def sign_in(user = create(:user))
    if user.nil?
      request.env['warden'].stub(:authenticate!).
        and_throw(:warden, { scope: :user })
      controller.stub current_user: nil
    else
      user.confirmed_at = Time.now
      user.save
      request.env['warden'].stub authenticate!: user
      controller.stub current_user: user
    end
    user
  end
end
