	class ChatManageController < ApplicationController
	def show
		@chat ||= ChatRoom.all
	end
	def edit
		@chat ||= ChatRoom.find(params[:format])
	end
	def update

		@chat = ChatRoom.find(params[:id])
	   if @chat.update(edit_params)

	   	redirect_to chat_manage_show_path
	   else 
	   	redirect_to chat_manage_update_path
	   end
	end

	def delete
		@chat ||= ChatRoom.find(params[:format])
		@chat.destroy
		redirect_to chat_manage_show_path
	end
	def profile
		@user ||= User.find(params[:format])
		@msg ||=User.find(params[:format]).msg
		@new = Msg.new
	end

	def create
		@new = Msg.new(new_params)
		@new.save
		redirect_to chat_manage_profile_path(current_user.id)
	end
	private
	def new_params
		params.require(:msg).permit!
	end
	def edit_params
       params.require(:chat_room).permit!#(:title)
	end
end
