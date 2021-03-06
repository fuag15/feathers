# Deals with Project related routes
class ProjectsController < ApplicationController
  # ensure that User is allowed by Ability
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the parent reouts project
  before_filter :load_category, only: [:new, :create, :edit]

  # paginate our categories
  def index
    @project_categories = ProjectCategory.page params[:page]
  end

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Project Created' if @project_category.projects.create params[:project]
    respond_with @project.project_category, @project
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Project Updated' if @project.update_attributes! params[:project]
    respond_with @project.project_category, @project
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Project Deleted' if @project.destroy
    respond_with @project.project_category
  end

  private
    # helper to load parent routes category for nested projects
    def load_category
      @project_category = ProjectCategory.find params[:project_category_id]
    end
end
