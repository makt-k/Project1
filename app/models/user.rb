class User < ActiveRecord::Base
  has_many :idealogs
  has_many :expos
end
