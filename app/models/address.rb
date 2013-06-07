# This route is a simple placeholder for where I currently life
class Address < ActiveRecord::Base
  # allow selected attributes to be retrieved and set
  attr_accessible :phone, :city, :street
end
