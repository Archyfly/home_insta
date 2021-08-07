class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
  end

  def show
    @post = current_user.posts.find(params[:id])
    #user = User.find_by_id(@post.user_id)
    #@user_posts = user.posts.all
    #@post_comments = @post.comments
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(current_user, @post), flash: { success: 'Post was added! '}
    else
      render :new, flash: { alert: 'Some errors occured'}
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@post), flash: { success: 'Post was updated! '}
    else
      render :edit, flash: { alert: 'Post NOT updated! '}
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to root_path, flash: { success: 'Post was deleted! '}
  end

  private

  def find_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

