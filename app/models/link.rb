class Link < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes
  belongs_to :user

  validates_presence_of :url
  validates_presence_of :name
end
