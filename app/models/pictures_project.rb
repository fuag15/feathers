# simple join for Picture and Project
class PicturesProject < ActiveRecord::Base
  belongs_to :picture
  belongs_to :project
end
