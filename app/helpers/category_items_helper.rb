# Helper to get children of Job or Project Categories
# these will be either Project or Job
module CategoryItemsHelper
  # return the children
  # used to help dry up views
  def related_people category_item
    if category_item.kind_of? Project
      "Team Members: #{category_item.team}"
    else
      "Employer: #{category_item.employer}"
    end
  end
end
