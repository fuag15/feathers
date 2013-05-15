class Job < ActiveRecord::Base
  belongs_to :job_category
  attr_accessible :blurb, :detail, :employer, :name, :rank

  belongs_to :job_category
  has_many :jobs_pictures
  has_many :pictures, through: :jobs_pictures
end
