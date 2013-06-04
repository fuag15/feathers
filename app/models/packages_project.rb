# A simple join table for Package and Project
class PackagesProject < ActiveRecord::Base
  attr_protected :package_id, :project_id
  belongs_to :package, dependent: :destroy
  belongs_to :project
end
