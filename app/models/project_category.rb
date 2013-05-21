# Dillineate personal projects by category has many Project
class ProjectCategory < ActiveRecord::Base
  # default order by rank to prioritize
  default_scope order 'rank asc'
  attr_accessible :name, :rank

  has_many :projects
end
