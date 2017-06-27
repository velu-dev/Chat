class ContactMailMailer < ApplicationMailer
  default from: "whiteplaast@gmail.com"
    def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
    end

end
