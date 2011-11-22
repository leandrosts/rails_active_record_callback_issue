class User < ActiveRecord::Base
  has_many :permissions
  has_many :vehicles, :through => :permissions
end
