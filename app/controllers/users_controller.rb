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
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user), flash: { success: "User successfully updated! by user?? #{@user.username}. current user is: #{current_user.username}" }
    else
      render :edit
    end
  end

  def destroy
    authorize User.find(params[:id])
    @user.destroy
    redirect_to users_path, flash: { success: 'User deleted.' }
  end

  def all_posts
    #@users = User.all
    @posts = Post.all
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :info, :image)
  end

end