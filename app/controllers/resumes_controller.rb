class ResumesController < ApplicationController
  skip_authorization_check

  def index
    @addresses = Address.all
    @resume_categories = ResumeCategory.all
  end
end
