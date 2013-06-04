# A join model for Job and Picture
class JobsPicture < ActiveRecord::Base
  belongs_to :job
  belongs_to :picture, dependent: :destroy
end
