class CallbackController < Devise::OmniauthCallbacksController
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])

        sign_in @user
        redirect_to '/select-goals'
    end
end
