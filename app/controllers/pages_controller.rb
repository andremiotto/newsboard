class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def contact
  end

  def about
  end

  def home
  end

  def my_articles
    @my_articles = Article.where(owner_id: current_user)
  end
end
