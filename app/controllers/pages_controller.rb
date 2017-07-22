class PagesController < ApplicationController
  before_action :load_commentable, only: [:show]


  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_path
    else
      render 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])

  end
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to pages_path
    else
      render 'edit'
    end
  end

  def show
    @page = Page.find(params[:id])
    @commentable = @page
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
    
  end
  def page_params
    params.require(:page).permit(:topic, :description)
  end
end
