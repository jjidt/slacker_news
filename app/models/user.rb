class User < ActiveRecord::Base
  has_many :links

  validates_presence_of :name
  validates_presence_of :password_digest
  validates :password, length: { minimum: 6 }

  has_secure_password

end
