class CallbackController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        puts 'ERROR'
        puts @user.errors.messages
        sign_in_and_redirect @user
    end
end