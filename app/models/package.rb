# Hosts zip files of projects, mostly meaningless due to github hosting
class Package < ActiveRecord::Base
  attr_accessible :file, :version
  # mounts the PackageUploader on the file attribute
  mount_uploader :file, PackageUploader

  # a join table PackagesProject
  has_many :packages_projects
  has_many :projects, through: :packages_projects
end
