class Post < ActiveRecord::Base
  attr_accessible :content, :picture, :title

  has_many :pictures_posts
  has_many :pictures, through: :pictures_posts
end
