# simple join table for Post and Picture
class PicturesPost < ActiveRecord::Base
  attr_protected :picture_id, :post_id
  belongs_to :post
  belongs_to :picture, dependent: :destroy
end
