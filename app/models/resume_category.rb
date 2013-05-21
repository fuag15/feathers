# Classify resume into types of skillsets
# see ResumeEntry
class ResumeCategory < ActiveRecord::Base
  # default order by rank for display
  default_scope order 'rank asc'
  attr_accessible :name, :rank

  has_many :resume_entries
end
