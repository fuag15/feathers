class Project < ActiveRecord::Base
  belongs_to :project_category
  attr_accessible :blurb, :detail, :name, :rank, :team, :version

  belongs_to :project_category

  has_many :packages_projects
  has_many :pictures_projects

  has_many :packages, through: :packages_projects
  has_many :pictures, through: :picutres_projects
end
