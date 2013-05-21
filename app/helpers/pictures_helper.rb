# Helper to get parents of Picture routes
# these will be either Post Project or Job
module PicturesHelper
  # return the right edit path
  # since we are multi using this model
  def owner_aware_edit_picture_path owner, picture
    if owner.class.to_s == 'Post'
      edit_post_picture_path owner, picture
    elsif owner.class.to_s == 'Project'
      edit_project_picture_path owner, picture
    else
      edit_job_picture_path owner, picture
    end
  end

  # return the right index path
  # since we are sharing this model
  def owner_aware_pictures_path owner
    if owner.class.to_s == 'Post'
      post_pictures_path owner
    elsif owner.class.to_s == 'Project'
      project_pictures_path owner
    else
      job_pictures_path owner
    end
  end

  # return the right new path
  # needed since this is a shared model
  def owner_aware_new_picture_path owner
    if owner.class.to_s == 'Post'
      new_post_picture_path owner
    elsif owner.class.to_s == 'Project'
      new_project_picture_path owner
    else
      new_job_picture_path owner
    end
  end
end
