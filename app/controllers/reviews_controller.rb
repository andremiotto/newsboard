class ReviewsController < ApplicationController
  before_action :set_article, only: [:create, :update, :new, :edit, :likes]
  before_action :set_user, only: [:create, :new, :edit, :update, :likes]
  before_action :set_review, only: [:edit, :update, :destroy, :likes]


  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.asker = @user
    @review.article = @article
    if @review.save
      respond_to  do |format|
        format.html {redirect_to article_path(@article)}
        format.js
        # redirect_to article_path(@article)
      end
    else
      respond_to do |format|
        format.html { render 'articles/show'}
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to article_path(@article)
    end
  end

  def likes
    if current_user.likes?(@review)
      @user.unlike!(@review)
      redirect_to article_path(@article),
      notice: "Unliked this comment successfully!"
    else
      @user.like!(@review)
      redirect_to article_path(@article),
      notice: "Liked this comment successfully!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:text)
  end

  def set_user
    @user = current_user
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
