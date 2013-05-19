class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_categories

  private
    def load_categories
      @project_categories = ProjectCategory.all
    end
end
