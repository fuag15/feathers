# This controller manages the restfull actions for our
# Address model, please see that for more info
class AddressesController < ApplicationController
  # authorize our resource with can can
  load_and_authorize_resource
  # the types of content each view serves
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Address Created' if @address.save
    respond_with @address
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Address Updated' if @address.update_attributes! params[:address]
    respond_with @address
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Address Deleted' if @address.destroy
    respond_with @address
  end
end
