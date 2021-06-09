class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = Users.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username,:profile_image,:introduction)
  end

end
