module WardenHelpers
  include Warden::Test::Helpers

  def create_and_log_user
    user = create :user
    login_as(user)
    user
  end
end
