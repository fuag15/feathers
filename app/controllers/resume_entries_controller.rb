class ResumeEntriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :load_category, only: [:new, :create, :edit]

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Resume Category Created' if @resume_category.resume_entries.create params[:resume_entry]
    respond_with @resume_entry
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Resume Category Updated' if @resume_entry.update_attributes! params[:resume_entry]
    respond_with @resume_entry
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Resume Category Deleted' if @resume_entry.destroy
    respond_with @resume_entry
  end

  private
    def load_category
      @resume_category = ResumeCategory.find params[:resume_category_id]
    end
end
