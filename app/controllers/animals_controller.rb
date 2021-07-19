class AnimalsController < ApplicationController
  include AnimalHelper
  def index
    @current_user = User.find_by(id: session[:user_id])

    if @current_user
      @animals = Animal.all
      @liked_animals = @current_user.liked_animals
      @disliked_animals = @current_user.disliked_animals
    else
      redirect_to :root_path
    end
  end

  def create
    @user = User.create(name: params.dig(:user, :name))
    session[:user_id] = @user.id if @user.save

    redirect_to root_path
  end
end
