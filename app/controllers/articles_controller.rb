class ArticlesController < ApplicationController
  before_action :require_user, except: [:index,:show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index 
    @article=Article.all
  end
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(params.require(:article).permit(:title,:description))
    @article.user_id = current_user.id
    @article.save
    if(@article.save)
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
    @article=Article.find(params[:id])
  end
  def edit
    @article=Article.find(params[:id])
  end
  def update
    @article=Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title,:description))
        redirect_to @article
    else
        render 'edit'
    end
  end
  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end
private
  def require_same_user
    if current_user.id != @article.user
      flash[:alert]="You can only edit or delete your own article"
      redirect_to @article
    end
  end
