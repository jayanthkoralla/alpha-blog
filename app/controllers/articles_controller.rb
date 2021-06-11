class ArticlesController < ApplicationController
  def index 
    @article=Article.all
  end
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(params.require(:article).permit(:title,:description))
    @article.user_id = User.last.id
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
