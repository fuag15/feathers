module ControllerUserHelper
  def auth_admin
    user = FactoryGirl.create :admin_user
    sign_in user
  end
end