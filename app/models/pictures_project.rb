# simple join for Picture and Project
class PicturesProject < ActiveRecord::Base
  belongs_to :picture, dependent: :destroy
  belongs_to :project
end
