# Deals with ResumeEntry related routes
class ResumeEntriesController < ApplicationController
  # ensure User is allowed by Ability and load up the models
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the parent category for relevant routes
  before_filter :load_category, only: [:new, :create, :edit]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Resume Entry Created' if @resume_category.resume_entries.create params[:resume_entry]
    respond_with @resume_category, @resume_entry
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Resume Entry Updated' if @resume_entry.update_attributes! params[:resume_entry]
    respond_with @resume_category, @resume_entry
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Resume Entry Deleted' if @resume_entry.destroy
    respond_with @resume_entry.resume_category, @resume_entry
  end

  private
    # loads the parent category on child routes
    def load_category
      @resume_category = ResumeCategory.find params[:resume_category_id]
    end
end
