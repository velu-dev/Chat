class ChatRoomsController < ApplicationController
def index
    @chat_rooms ||= ChatRoom.all
    @profile=User.all
#    render json:@profile
  end
    def new
    @chat_room ||= ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room ||= ChatRoom.includes(:messages).find_by(id: params[:id])
    #@profile_pic = User.check_pic(current_user)
    @message = Message.new
  end
  def delete
    @chat1 = ChatRoom.find(params[:format]).messages
    @chat1.delete_all
  end
  
  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
end
end
