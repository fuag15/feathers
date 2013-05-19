class ProjectCategory < ActiveRecord::Base
  default_scope order 'rank asc'
  attr_accessible :name, :rank

  has_many :projects
end
