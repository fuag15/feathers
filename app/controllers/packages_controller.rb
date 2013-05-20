class PackagesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_project, only: [:new, :create, :edit, :index]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Package Created' if @project.packages.create params[:package]
    respond_with @package
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Package Updated' if @package.update_attributes! params[:package]
    respond_with @package
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Package Deleted' if @package.destroy
    redirect_to project_path(@package.projects.first)
  end

  private
    def load_project
      @project = Project.find params[:project_id]
    end
end
