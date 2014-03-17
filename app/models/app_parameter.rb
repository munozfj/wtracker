class AppParameter < ActiveRecord::Base
  scope :ordered, lambda { order("'group' asc, position asc ")}

end
