class Post < ActiveRecord::Base
  default_scope order 'created_at desc'
  attr_accessible :content, :picture, :title

  has_many :pictures_posts
  has_many :pictures, through: :pictures_posts
end
