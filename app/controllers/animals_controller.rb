class AnimalsController < ApplicationController
  include AnimalHelper
  def index
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

  def like
    @animal = Animal.find(params[:id])

    disliked_animals = DislikedAnimalsUser.find_by(user: @current_user, animal: @animal)
    disliked_animals&.destroy

    @current_user.liked_animals << @animal

    render json: {
      html: render_to_string(partial: 'animals/display', locals: { animal: @animal, user: @current_user})
    }
  end

  def reset
    @animal = Animal.find(params[:id])

    liked_animals = LikedAnimalsUser.find_by(user: @current_user, animal: @animal)
    liked_animals&.destroy

    disliked_animals = DislikedAnimalsUser.find_by(user: @current_user, animal: @animal)
    disliked_animals&.destroy

    render json: {
      html: render_to_string(partial: 'animals/display', locals: { animal: @animal, user: @current_user})
    }
  end

  def dislike
    @animal = Animal.find(params[:id])

    liked_animals = LikedAnimalsUser.find_by(user: @current_user, animal: @animal)
    liked_animals&.destroy

    @current_user.disliked_animals << @animal

    render json: {
      html: render_to_string(partial: 'animals/display', locals: { animal: @animal, user: @current_user})
    }
  end
end
