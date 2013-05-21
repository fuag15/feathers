# A work related experience related to a ResumeCategory
class ResumeEntry < ActiveRecord::Base
  # default order by rank for display
  default_scope order 'rank asc'
  belongs_to :resume_category
  attr_accessible :name, :rank

  belongs_to :resume_category
end
