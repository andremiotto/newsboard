class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = Article.order('created_at DESC')
  end

  # def user_index
  #   @user_articles = Article.where(owner_id: params[:user_id])
  # end

  def show
  end

  def new
    # @user needed on simple_form_for at articles_form
    # @user = User.find(params[:user_id])

    @user = current_user
    @article = Article.new
    # @article = current_user.article.build_article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    # @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).
    permit(:url, :comment)
    #.merge(user: current_user) = Pode substituir linha 27.
  end
end
