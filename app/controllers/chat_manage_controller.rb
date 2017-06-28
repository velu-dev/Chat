class ChatManageController < ApplicationController
	def show
		@chat = ChatRoom.all
	end
	def edit
		@chat = ChatRoom.find(params[:format])
	end
	def update
		byebug
		@chat = ChatRoom.find(params[:format])
	   if @chat.update(edit_params)

	   	redirect_to chat_manage_show_path
	   else 
	   	redirect_to chat_manage_update1_path
	   end
	end

	def delete
		@chat = ChatRoom.find(params[:format])
		@chat.destroy
		redirect_to chat_manage_show_path
	end
	def profile
		@user = User.find(params[:format])
	end
	def m_delete
	end
	private
	def edit_params
       params.require(:chat).permit(:title)
	end
end
