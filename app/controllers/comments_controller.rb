class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  before_action :find_post

  def index
    @comments = @post.comments.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to user_posts_path
    else
      render :new
    end
  end

  private

  def find_post
    #@post = current_user.posts.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
