class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :cars
  belongs_to :car
  validates :car_id, presence: true
end
