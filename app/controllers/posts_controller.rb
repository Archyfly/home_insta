class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
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
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to user_posts_path, flash: { success: 'Post was updated! '}
    else
      render :edit, flash: { alert: 'Post NOT updated! '}
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
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

