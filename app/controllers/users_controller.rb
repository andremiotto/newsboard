class UsersController < ApplicationController

  before_action :set_user, only: [:follow]
  before_action :set_user_articles, only: [:show, :mainpage, :my_articles]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  def follow
    if current_user.follows?(@user)
      current_user.unfollow!(@user)
      redirect_to user_path(@user), notice: "Unfollowed user!"
    else
      current_user.follow!(@user)
      redirect_to user_path(@user), notice: "Following user!"
    end
  end

  def mainpage
    @user = current_user
  end

  def my_articles
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_user_articles
    @my_articles = Article.where(owner_id: current_user)
  end

end
