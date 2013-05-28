# Holds blog like posts, has many Picture
class Post < ActiveRecord::Base
  default_scope order 'created_at desc'
  attr_accessible :content, :picture, :title
  # see PictureUploader
  mount_uploader :picture, PictureUploader

  has_many :pictures_posts, dependent: :destroy
  has_many :pictures, through: :pictures_posts, dependent: :destroy
end
