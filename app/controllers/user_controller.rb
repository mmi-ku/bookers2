class UserController < ApplicationController
  def show
  end

  def edit
  end

  def view
  end
  
  def index
  @user = User.all
  end
  
end
