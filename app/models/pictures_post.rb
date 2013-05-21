# simple join table for Post and Picture
class PicturesPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :picture
end
