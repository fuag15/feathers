class JobsController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_categories, only: [:index]
  before_filter :load_category, only: [:new, :create, :edit]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Job Created' if @job_category.jobs.create params[:job]
    respond_with @job
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Job Updated' if @job.update_attributes! params[:job]
    respond_with @job
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Job Deleted' if @job.destroy
    respond_with @job
  end

  private
    def load_category
      @job_category = JobCategory.find params[:job_category_id]
    end

    def load_categories
      @job_categories = JobCategory.all
    end
end
