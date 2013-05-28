# holds personal projects has many Picture and Package
# belongs to a Category
class Project < ActiveRecord::Base
  # default order by rank
  default_scope order 'rank asc'
  belongs_to :project_category
  attr_accessible :blurb, :detail, :name, :rank, :team

  belongs_to :project_category

  has_many :packages_projects, dependent: :destroy
  has_many :pictures_projects, dependent: :destroy

  has_many :packages, through: :packages_projects, dependent: :destroy
  has_many :pictures, through: :pictures_projects, dependent: :destroy
end
