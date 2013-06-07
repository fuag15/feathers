# Deals with Package related routes
class PackagesController < ApplicationController
  # make sure the User is allowed by Ability
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the parent project on routes that need it for display
  before_filter :load_owner, except: [:destroy, :show, :edit, :update]

  # narrow our loaded images down
  def index
    @packages = @owner.packages
  end

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Package Created' if @owner.packages << @package
    respond_with @owner, @package
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Package Updated' if @package.update_attributes! params[:package]
    respond_with @owner, @package
  end

  # almost default destroy, on success sends a good message
  def destroy
    owner = @package.owner
    flash[:notice] = 'Package Deleted' if @package.destroy
    respond_with owner, @package
  end

  private
    # find the parent project picture from the related route
    def load_owner
      local_params = params
      if local_params[:project_id]
        @owner = Project.find params[:project_id]
      else
        @owner = Job.find local_params[:job_id]
      end
    end
end
