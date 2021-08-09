class PhotosController < ApplicationController
  before_action :find_post #, only: [:index, :new, :create, :update]
  before_action :authenticate_user!, only: %i[new create update destroy]


  def index
    @photos = @post.photos.all
  end

  def new
    @photo = @post.photos.new
  end

  def create
    @photo = @post.photos.create(photo_params)
    if @photo.save
      flash[:success] = 'Photo added!'
      #redirect_to user_post_path(@user.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:success] = 'Photo edited!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  #TODO
  #def find_user
  #  @user = User.find(params[:user_id])
  #end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :remove_image)
  end

end

