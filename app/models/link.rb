class Link < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes
  belongs_to :user

  validates_presence_of :url
  validates_presence_of :name

  def rank
    scale = 1000
    votes = self.votes.length
    life = Time.now - self.created_at
    adjusted_life = life/5
    -(adjusted_life**2) + (votes*adjusted_life) + votes*scale
  end

end
