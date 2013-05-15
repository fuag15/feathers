class Package < ActiveRecord::Base
  attr_accessible :file, :version
  mount_uploader :file, PackageUploader

  has_many :packages_projects
  has_many :projects, through: :packages_projects
end
