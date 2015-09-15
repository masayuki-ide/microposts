class UsersController < ApplicationController
  def show # 追加
    @user = User.find(params[:id])
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
