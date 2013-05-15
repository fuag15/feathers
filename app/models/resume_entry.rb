class ResumeEntry < ActiveRecord::Base
  belongs_to :resume_category
  attr_accessible :name, :rank

  belongs_to :resume_category
end
