# Deal with restfull routes for Job
class JobsController < ApplicationController
  # ensure the User is allowed by Ability
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the parent category on endex
  before_filter :load_categories, only: [:index]
  # load the parent category on routes that need it for forms
  before_filter :load_category, only: [:new, :create, :edit]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Job Created' if @job_category.jobs.create params[:job]
    respond_with @job.job_category, @job
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Job Updated' if @job.update_attributes! params[:job]
    respond_with @job.job_category, @job
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Job Deleted' if @job.destroy
    respond_with @job.job_category
  end

  private
    # load the supplied catgory for appropriate routes
    def load_category
      @job_category = JobCategory.find params[:job_category_id]
    end

    # loads all categories for the index route
    def load_categories
      @job_categories = JobCategory.all
    end
end
