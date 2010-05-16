class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :role
#  attr_accessible :username, :email, :password, :password_confirmation
end
