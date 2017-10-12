class ArticlesController < ApplicationController
  
  #lets investigate cancan...
  before_action :authenticate_user!,
    :only => [:destroy, :edit]
  
  def index
    @articles = Article.order('id ASC').all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def edit
    Devise:authenticate_user!
    @article = Article.find(params[:id])
  end
  
  def update
      @article = Article.find(params[:id])
      
      if @article.update(article_params)
        redirect_to @article
      else
        flash[:danger] = @article.errors.full_messages
        render 'edit'
      end
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #render plain:params[:article].inspect
    #Above is for checking it out.
    @article =Article.new(article_params)
    if @article.save
      redirect_to @article
    else
        render 'new'
    end
    
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end