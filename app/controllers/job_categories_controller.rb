# Deals with JobCategory related restfull routes
class JobCategoriesController < ApplicationController
  # load initial controller variables if authorized by Ability
  load_and_authorize_resource
  # serve up html routes
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Job Category Created' if @job_category.save
    respond_with @job_category
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Job Category Updated' if @job_category.update_attributes! params[:job_category]
    respond_with @job_category
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Job Category Deleted' if @job_category.destroy
    respond_with @job_category
  end
end
