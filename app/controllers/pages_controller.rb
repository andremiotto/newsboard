class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :profile]

  before_action :set_user_articles, only: [:profile, :my_articles]

  def contact
  end

  def about
  end

  def home
  end

  def profile
    @user = current_user
  end

  def my_articles
  end

  private

  def set_user_articles
    @my_articles = Article.where(owner_id: current_user)
  end
end
