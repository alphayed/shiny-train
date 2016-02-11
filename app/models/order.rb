class Order < ActiveRecord::Base
  belongs_to :user
  has_one :car

  validates :user_car, presence: true
end
