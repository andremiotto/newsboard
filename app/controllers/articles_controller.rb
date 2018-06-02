class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_user, only: [:new, :likes]
  before_action :set_article, only: [:show, :edit, :update, :destroy, :likes]

  def index
    @articles = Article.order('created_at DESC')
  end

  def show
    # Needed to scrape urls
    require 'open-uri'
    # Reviews de @article
    # @reviews = Review.where(article: @article)
    @review = Review.new
  end

  def new
    # @user needed on simple_form_for at articles_form
    # @user = User.find(params[:user_id])
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
    redirect_to articles_path
  end

  def url_data
    # @url_object = OpenGraphReader.fetch("#{@articles.url}")
  end

  def likes
    if current_user.likes?(@article)
      @user.unlike!(@article)
      redirect_to article_path(@article), notice: "Unliked this post successfully!"
    else
      @user.like!(@article)
      redirect_to article_path(@article), notice: "Liked this post successfully!"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).
    permit(:url, :comment)
    #.merge(user: current_user) = Pode substituir linha 27.
  end
end
