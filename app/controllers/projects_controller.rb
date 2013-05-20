class ProjectsController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_categories, only: [:index]
  before_filter :load_category, only: [:new, :create, :edit]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Job Created' if @project_category.projects.create params[:project]
    respond_with @project
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Job Updated' if @project.update_attributes! params[:project]
    respond_with @project
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Job Deleted' if @project.destroy
    respond_with @project
  end

  private
    def load_category
      @project_category = ProjectCategory.find params[:project_category_id]
    end

    def load_categories
      @project_categories = ProjectCategory.all
    end
end
