class DirectMessagesController < ApplicationController
  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:direct_message][:room_id]).present?
      @direct_messages = DirectMessage.create(params.require(:direct_message).permit(:user_id, :comment, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@direct_messages.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
