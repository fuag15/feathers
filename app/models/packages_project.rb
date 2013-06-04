# A simple join table for Package and Project
class PackagesProject < ActiveRecord::Base
  belongs_to :package, dependent: :destroy
  belongs_to :project
end
