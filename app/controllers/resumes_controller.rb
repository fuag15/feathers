# Serves up Resume routes, for now there is no model atteched
# but it is planned to have resume's tailored to each type of job
# and have them formatted apropriately in the future
class ResumesController < ApplicationController
  # do not authorize this resourc as there is no model for it
  skip_authorization_check

  # simple index route to server the old resume layout
  def index
    @addresses = Address.all
    @resume_categories = ResumeCategory.all
  end
end
