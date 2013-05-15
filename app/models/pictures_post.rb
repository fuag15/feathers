class PicturesPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :picture
  # attr_accessible :title, :body
end
