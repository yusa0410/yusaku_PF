class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

  def show
    @user = User.find(params[:id])
    @users = User.page(params[:page]).reverse_order
    @currentUserEntry=Entry.where(user_id: current_user.id) #DM機能5行目〜２２行目
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def index
    @users = User.page(params[:page]).reverse_order
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

  def follows
    @user = User.find(params[:id])
    @followings = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end

  private
  def user_params
    params.require(:user).permit(:username,:profile_image,:introduction)
  end

  def  ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
