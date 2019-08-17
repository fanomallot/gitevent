class Event < ApplicationRecord
belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :participants , through: :attendances, class_name: "User"
  validates :start_date ,
  presence: true 
  validates :duration,
  presence: true,
  numericality: true
  validate :duration_5?
  validates :title, 
  presence: true,
  length: { in: 5..140 }
  validates :description, 
  presence: true,
  length: {in: 20..1000}
  validates :price,
  presence: true,
  numericality: true,
  inclusion: { in: 1..1000}
  validates :location, 
  presence: true
  private
  def duration_5?
    if duration > 0 && duration % 5 == 0
      return true
    else
      errors.add(:duration, "Le durée doits être positif et multiple de 5")
      return false
    end
    
  end
end
