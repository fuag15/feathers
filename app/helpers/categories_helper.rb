# Helper to get children of Job or Project Categories
# these will be either Project or Job
module CategoriesHelper
  # return the children
  # used to help dry up views
  def category_items category
    if category.kind_of? ProjectCategory
      category.projects
    else
      category.jobs
    end
  end
end
