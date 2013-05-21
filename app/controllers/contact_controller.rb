# Deals with contact emails, specificly Contact
class ContactController < ApplicationController
  # do not check ability for this controllers routes
  skip_authorization_check

  # dummy def just loads form
  def index
  end

  # this method handles input from the contact form
  # shoots off a mail from ContactMailer#contact
  def submit
    local_params = params
    Contact.contact(local_params[:from], local_params[:text]).deliver
    redirect_to contact_path, notice: 'Contact mail sent'
  end
end
