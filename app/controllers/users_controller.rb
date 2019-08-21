class UsersController < ApplicationController

  def index
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
  end

  def profile
    @user = current_user
  end

  def card
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end