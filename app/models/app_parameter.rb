class AppParameter < ActiveRecord::Base
  scope :ordered, lambda { order("1 asc, position asc ")}

end
