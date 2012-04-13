class User < ActiveRecord::Base
  has_many :user_levels
  has_many :levels, :through => :user_levels
  
  validates_uniqueness_of :name
end
