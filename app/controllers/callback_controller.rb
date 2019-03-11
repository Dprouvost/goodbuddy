class CallbackController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        p @user.errors.messages
        sign_in @user
        redirect_to '/location'
    end
end
