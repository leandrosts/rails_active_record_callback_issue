class Vehicle < ActiveRecord::Base
  has_many :permissions
  has_many :users, :through => :permissions
end
