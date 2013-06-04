# A join model for Job and Picture
class JobsPicture < ActiveRecord::Base
  attr_protected :job_id, :picture_id
  belongs_to :job
  belongs_to :picture, dependent: :destroy
end
