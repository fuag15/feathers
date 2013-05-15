class PicturesProject < ActiveRecord::Base
  belongs_to :picture
  belongs_to :project
  # attr_accessible :title, :body
end
