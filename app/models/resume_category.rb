class ResumeCategory < ActiveRecord::Base
  default_scope order 'rank asc'
  attr_accessible :name, :rank

  has_many :resume_entries
end
