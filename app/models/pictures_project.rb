# simple join for Picture and Project
class PicturesProject < ActiveRecord::Base
  attr_protected :pictures_id, :project_id
  belongs_to :picture, dependent: :destroy
  belongs_to :project
end
