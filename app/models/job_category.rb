# Seperates out Different types of work
class JobCategory < ActiveRecord::Base
  # default order by rank to prioritize
  default_scope order 'rank asc'
  # allow getters and setters for these attributes
  attr_accessible :name, :rank

  # has many Job
  has_many :jobs
end
