class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_car, presence: true
end
