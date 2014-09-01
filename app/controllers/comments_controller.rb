class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    if params[:link_id]
      @link = Link.find(params[:link_id])
    elsif params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      @link = Link.new
    end
  end

  def create
    if params[:comment][:link_id] != ""
      @link = Link.find(params[:comment][:link_id])
      @comment = @link.comments.new(comments_params)
      @link_id = @link.id
    elsif params[:parent_comment_id] != ""
      @parent_comment = Comment.find(params[:parent_comment_id])
      @comment = @parent_comment.comments.new(comments_params)
      @link_id = @parent_comment.link_id
    end
    if @comment.save
      flash[:notice] = "Comment saved, thank you for contributing!"
      redirect_to(link_path(@link_id))
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
    params.require(:comment).permit(:name, :text, :link_id)
  end
end
