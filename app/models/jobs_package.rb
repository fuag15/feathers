# A join model for Job and Package
class JobsPackage < ActiveRecord::Base
  attr_protected :package_id, :job_id
  belongs_to :package, dependent: :destroy
  belongs_to :job
end
