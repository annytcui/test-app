class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'static_pages/home'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(update_params)
      # Handle a successful update.
    else
      render 'show'
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:firstname, :lastname, :gender, :birthday)
    end
end
