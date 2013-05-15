class PackagesProject < ActiveRecord::Base
  belongs_to :package
  belongs_to :project
  # attr_accessible :title, :body
end
