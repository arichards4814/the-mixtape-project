class UserMailer < ApplicationMailer

    def welcome_email(current_user)
        @user = current_user
        mail(to: @user.email, subject: 'Welcome to our awesome site!')
    end

    def send_mixtape(current_user, recipient, mixtape)

        attachments.inline["mixtape.png"] = File.read(Rails.root.join("app/assets/images/#{mixtape.cassette_url}"))

        @user = current_user
        @mixtape = mixtape
        mail(to: recipient, subject: "#{@user.user_name} sent you a mixtape!")
    end

end
