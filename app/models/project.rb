class Project < ActiveRecord::Base
  default_scope order 'rank asc'
  belongs_to :project_category
  attr_accessible :blurb, :detail, :name, :rank, :team

  belongs_to :project_category

  has_many :packages_projects
  has_many :pictures_projects

  has_many :packages, through: :packages_projects
  has_many :pictures, through: :pictures_projects
end
