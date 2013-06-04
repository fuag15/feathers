# Deals with Package related routes
class PackagesController < ApplicationController
  # make sure the User is allowed by Ability
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the parent project on routes that need it for display
  before_filter :load_project, only: [:new, :create, :edit, :index]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Package Created' if @project.packages << @package
    respond_with @project, @package
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Package Updated' if @package.update_attributes! params[:package]
    respond_with @project, @package
  end

  # almost default destroy, on success sends a good message
  def destroy
    project = @package.projects.first
    flash[:notice] = 'Package Deleted' if @package.destroy
    respond_with project, @package
  end

  private
    # find the parent project from the related route
    def load_project
      @project = Project.find params[:project_id]
    end
end
