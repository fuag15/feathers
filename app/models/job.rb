# Module represents past jobs I've been employed to do
# this module could use a date attribute
class Job < ActiveRecord::Base
  # default order by rank
  default_scope order 'rank asc'
  # Allow getters and estters for these values
  attr_accessible :blurb, :detail, :employer, :name, :rank

  # it has one JobCategory
  belongs_to :job_category
  # it has many JobsPicture, essentially a join table
  has_many :jobs_pictures, dependent: :destroy
  # a through relations ship to Picture
  has_many :pictures, through: :jobs_pictures, dependent: :destroy
end
