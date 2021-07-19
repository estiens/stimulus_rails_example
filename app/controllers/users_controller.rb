class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.create(name: params.dig(:user, :name))
    session[:user_id] = @user.id if @user.save

    redirect_to root_path
  end
end
