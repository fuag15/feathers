class ResumeCategoriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Resume Category Created' if @resume_category.save
    respond_with @resume_category
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Resume Category Updated' if @resume_category.update_attributes! params[:resume_category]
    respond_with @resume_category
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Resume Category Deleted' if @resume_category.destroy
    respond_with @resume_category
  end
end
