class User < ActiveRecord::Base
  has_many :links

  validates_presence_of :name
  validates_presence_of :password_digest
  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :name

  has_secure_password

end
