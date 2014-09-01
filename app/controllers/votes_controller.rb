class VotesController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    if current_user
      @vote = @link.votes.new({:user_id => current_user.id})
      if @vote.save
        flash[:notice] = "Upvoted!"
        redirect_to :back
      else
        flash[:alert] = "Already Voted"
        redirect_to :back
      end
    else
      flash[:alert] = "Must be logged in to vote."
      redirect_to :back
    end
  end

end
