# On Can Can Access Denied we send to root page see Ability
class ApplicationController < ActionController::Base
  # do csrf token protection
  protect_from_forgery
  # ensure that we do a can can ability check
  check_authorization unless: :devise_controller?

  # catch auth problems, send them back to root, see Ability
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
