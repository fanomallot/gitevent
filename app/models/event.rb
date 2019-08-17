class Event < ApplicationRecord
belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :participants , through: :attendances, class_name: "User"

end
