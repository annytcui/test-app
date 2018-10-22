class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:primary] = "Please check your email."
      redirect_to root_url
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
      redirect_to @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to current_user
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:firstname, :lastname, :gender, :birthday)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end

    # Confirms an admin user.
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
