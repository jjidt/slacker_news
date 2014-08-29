class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessor :password_confirmation

  validates_presence_of :name
  validates_presence_of :password_digest

end
