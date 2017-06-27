class User < ApplicationRecord
  # Include default devise modules. Others available are:
   mount_uploader :profile_pic, ProfilePicUploader
 # :confirmable, :lockable, :timeoutable and :omniauthable
   has_many :chat_rooms, dependent: :destroy
   has_many :messages, dependent: :destroy
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   def name
    email.split('@')[0]
   end
end
