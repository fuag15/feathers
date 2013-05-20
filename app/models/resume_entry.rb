class ResumeEntry < ActiveRecord::Base
  default_scope order 'rank asc'
  belongs_to :resume_category
  attr_accessible :name, :rank

  belongs_to :resume_category
end
