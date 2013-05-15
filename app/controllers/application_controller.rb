# On Can Can Access Denied we send to root page see Ability
class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization unless: :devise_controller?

  # catch auth problems, send them back to root, see Ability
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
