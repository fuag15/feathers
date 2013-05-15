class ContactController < ApplicationController
  # this method handles input from the contact form
  # shoots off a mail from ContactMailer#contact
  def submit
    local_params = params
    Contact.contact(local_params[:from], local_params[:text]).deliver
    redirect_to contact_path, notice: 'Contact mail sent'
  end
end
