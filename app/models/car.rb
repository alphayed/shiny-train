class Car < ActiveRecord::Base
  belongs_to :user
  belongs_to :orders

  validates :car_type, presence:true
  validates :make, presence:true
  validates :model, presence:true
  validates :color, presence:true
  validates :year, presence:true
end
