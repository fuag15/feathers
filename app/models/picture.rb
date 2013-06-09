# Hosts pictures on many models for display
# see Post Project and Job
class Picture < ActiveRecord::Base
  attr_accessible :image, :name, :rank
  # see PictureUploader for more info
  mount_uploader :image, PictureUploader
  # default order by rank ascending
  default_scope order 'rank asc'

  has_many :pictures_posts, dependent: :destroy
  has_many :pictures_projects, dependent: :destroy
  has_many :jobs_pictures, dependent: :destroy

  has_many :posts, through: :pictures_posts
  has_many :projects, through: :pictures_projects
  has_many :jobs, through: :jobs_pictures

  # helper function to find out which model is our owner
  def owner
    self.projects.first or self.posts.first or self.jobs.first
  end
end
