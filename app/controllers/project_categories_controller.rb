class ProjectCategoriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Project Category Created' if @project_category.save
    respond_with @project_category
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Project Category Updated' if @project_category.update_attributes! params[:project_category]
    respond_with @project_category
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Project Category Deleted' if @project_category.destroy
    respond_with @project_category
  end
end
