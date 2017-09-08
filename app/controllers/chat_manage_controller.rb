	class ChatManageController < ApplicationController
	def show
		@chat ||= ChatRoom.all
	
		#render json: @chat
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

		@msg ||=Msg.where(to_id: params[:format])#User.find(params[:format]).msgs#.where(to_id: 7)#Msg.find_by(to_id: params[:format]).user#User.find(params[:format]).msg
		@message = Msg.new
	end

	def create
		@message = Msg.new(new_params)
		if @message.save
			redirect_to chat_manage_profile_path(params[:msg][:to_id])
		end
	end
	private
	def new_params
		params.require(:msg).permit!
	end
	def edit_params
       params.require(:chat_room).permit!#(:title)
	end
end
