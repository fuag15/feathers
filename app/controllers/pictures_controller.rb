# Deal wiht Picture related routes
class PicturesController < ApplicationController
  # ensure User is allowed by Ability
  load_and_authorize_resource
  # serve up html
  respond_to :html
  # load the owner of the picture smartly based on routes
  before_filter :load_owner, except: [:destroy, :show, :edit, :update]

  # narrow our loaded images down
  def index
    @pictures = @owner.pictures
  end

  # create and return to a smart path based on our parent
  def create
    flash[:notice] = 'Picture Created' if @owner.pictures << @picture
    respond_with @owner, @picture
  end

  # update and return to a smart path based on our parent
  def update
    flash[:notice] = 'Picture Updated' if @picture.update_attributes! params[:picture]
    respond_with @picture.owner, @picture
  end

  # destroy and return to our parents picture index path
  def destroy
    owner = @picture.owner
    flash[:notice] = 'Picture Deleted' if @picture.destroy
    respond_with owner, @picture
  end

  protected
    # we need the parent for some routes
    # so here we do some introspection on how we were called
    # and set the right parent to Post or Project or Job
    def load_owner
      local_params = params
      if local_params[:post_id]
        @owner = Post.find local_params[:post_id]
      elsif local_params[:project_id]
        @owner = Project.find local_params[:project_id]
      else
        @owner = Job.find local_params[:job_id]
      end
    end
end
