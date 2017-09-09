class User < ApplicationRecord
  # Include default devise modules. Others available are:
   mount_uploader :profile_pic, ProfilePicUploader
 # :confirmable, :lockable, :timeoutable and :omniauthable
   has_many :chat_rooms, dependent: :destroy
   has_many :messages, dependent: :destroy
   has_many :msg, dependent: :destroy
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :online, lambda{ where("updated_at > ?", 2.minutes.ago) }
   def name
    email.split('@')[0]
   end

   def online?
      updated_at > 10.minutes.ago
   end
   #def self.check_pic(current_user)
   #	@profile_pic = current_user.gender == "Male" ? "male.png" : "female.png"
    #@profile_pic = current_user.profile_pic.present? ? current_user.profile_pic : @profile_pic
    #return @profile_pic
   #end
end
