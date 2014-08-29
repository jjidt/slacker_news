
class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(links_params)

    if @link.save
      flash[:notice] = "New Link Submitted"
      redirect_to :root
    else
      flash[:alert] = "Unable to Submit Link"
      render('new')
    end

  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(links_params)
      flash[:notice] = "Updated Link"
      redirect_to(link_path(@link))
    else
      flash[:alert] = "Unable to update link"
      render('edit')
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to(links_path)
  end

private

  def links_params
      params.require(:link).permit(:url, :votes, :name)
  end
end
