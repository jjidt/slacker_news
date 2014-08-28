class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @link = Link.find(params[:link_id])
  end

  def create
    @link = Link.find(params[:comment][:link_id])
    @comment = @link.comments.new(comments_params)
    if @comment.save
      flash[:notice] = "Comment saved, thank you for contributing!"
      redirect_to(link_path(Link.find(@comment.link_id)))
    else
      flash[:alert] = "Unable to save comment"
      render('new')
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comments_params)
      flash[:notice] = "Comment Updated"
      redirect_to(comment_path(@comment))
    else
      flash[:alert] = "Unable to Update Comment"
      render('edit')
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_path)
  end

private

  def comments_params
    params.require(:comment).permit(:name, :text, :link_id, :comment_id)
  end
end
