class JobsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_categories

  private
    def load_categories
      @job_categories = JobCategory.all
    end
end
