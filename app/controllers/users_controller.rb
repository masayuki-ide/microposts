class UsersController < ApplicationController
  before_action :current_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user[:id])
    
    # @user = User.new(profile_params)
    # redirect_to @user =current_user 
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def followings
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end

   def followers
     @title = "Followers"
     @user = User.find(params[:id])
     @users = @user.follower_users
     render 'show_follow'
   end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:location,:description,
                                 :password_confirmation)
  end
  
  def profile_params
    params.require(:user).permit(:name, :email, :location,
                                    :description)
  end 
  
  

  
end
