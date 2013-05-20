class PostsController < ApplicationController
  load_and_authorize_resource
  respond_to :html

  # simple create method on true sends a good notice
  def create
    flash[:notice] = 'Post Created' if @post.save
    respond_with @post
  end

  # simple update method on success sends a good method
  def update
    flash[:notice] = 'Post Updated' if @post.update_attributes! params[:post]
    respond_with @post
  end

  # almost default destroy, on success sends a good message
  def destroy
    flash[:notice] = 'Post Deleted' if @post.destroy
    respond_with @post
  end
end
