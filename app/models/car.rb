class Car < ActiveRecord::Base
  belongs_to :user
  validates :car_type, presence:true
  validates :make, presence:true
  validates :model, presence:true
  validates :color, presence:true
  validates :year, presence:true
end
