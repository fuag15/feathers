class Picture < ActiveRecord::Base
  attr_accessible :image
  mount_uploader :image, PictureUploader

  has_many :pictures_posts
  has_many :pictures_projects
  has_many :jobs_pictures

  has_many :posts, through: :pictures_posts
  has_many :projects, through: :pictures_projects
  has_many :jobs, through: :jobs_pictures
end
