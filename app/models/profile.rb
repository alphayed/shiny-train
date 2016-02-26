class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :contact_email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
end
