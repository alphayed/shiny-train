require 'test_helper'

class CarTest < ActiveSupport::TestCase
  def setup 
    @user = users(:ahmed)
    @car = Car.new(make: "BMW", user_id: @user.id)
  end
  
  test "should be vaild" do
    assert @car.vaild?
  end
  
  test "user id should be present" do
    @car.user_id = nil
    assert_not @car.valid?
  end
end
