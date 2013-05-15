module ControllerUserHelper
  def auth_admin
    user = FactoryGirl.create :user, role: 'admin'
    sign_in user
  end
end