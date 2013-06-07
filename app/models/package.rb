# Hosts zip files of projects, mostly meaningless due to github hosting
class Package < ActiveRecord::Base
  attr_accessible :file, :version
  # mounts the PackageUploader on the file attribute
  mount_uploader :file, PackageUploader

  # a join table PackagesProject
  has_many :jobs_packages, dependent: :destroy
  has_many :packages_projects, dependent: :destroy

  has_many :projects, through: :packages_projects
  has_many :jobs, through: :jobs_packages

  # helper function to find out which model is our owner
  def owner
    self.projects.first or self.jobs.first
  end
end
