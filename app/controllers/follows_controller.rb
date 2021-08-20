class FollowsController < ActionController::Base
  before_action :authenticate_user!

  def create
    follower_user = current_user
    following_user = User.find(params[:following_id])
    #if !Follow.find(following_user.id)
      Follow.create(follower: follower_user, following: following_user)
    #end
    redirect_to user_followers_path(current_user)
  end

end