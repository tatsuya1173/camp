class UsersController < ApplicationController
  # before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Update successfully"
      redirect_to users_path
    else
      flash[:alert] = 'Update not successfully'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
