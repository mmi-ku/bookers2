class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(@user)
    end 
  end

  def view
  end
  
  def index
  @user = User.all
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path(@user)
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
