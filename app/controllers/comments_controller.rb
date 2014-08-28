class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comments = Comment.new
  end

  def create
    @comments = Comment.new(comments_params)

    if @comments.save
      flash[:notice] = "Comment saved, thank you for contributing!"
      redirect_to(comments_path)
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

  end

private

  def comments_params
    params.require(:comment).permit(:name, :text, :link_id, :comment_id)
  end
end
