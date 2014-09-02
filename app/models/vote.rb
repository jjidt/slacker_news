class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  # validates :user_id, uniqueness: { scope: :link_id, message: "you can only upvote a link once" }


end
