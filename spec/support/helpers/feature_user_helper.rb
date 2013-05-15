module FeatureUserHelper
  def auth_admin
    @user = FactoryGirl.create :user, role: 'admin'
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'Sign in'
  end
end