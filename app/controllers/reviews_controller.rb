class ReviewsController < ApplicationController
  before_action :set_article, only: [:create, :update, :new, :edit]
  before_action :set_user, only: [:create, :new, :edit, :update]
  before_action :set_review, only: [:edit, :update]


  def index
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
        redirect_to article_path(@article)
      end
    else
      respond_to do |format|
        format.html { render 'shared/form_reviews'}
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
      render :new
    end
  end

  def destroy
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
