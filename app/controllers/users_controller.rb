class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to users_path, flash: { success: 'User successfully created!' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: 'User successfully updated!' }
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, flash: { success: 'User deleted.' }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :info, :image)
  end

end