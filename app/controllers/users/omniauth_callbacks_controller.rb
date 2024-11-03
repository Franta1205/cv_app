# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user, event: :authentication
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Github"
      redirect_to edit_your_cv_cv_index_path
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to root_path, alert: @user.errors.full_messages.join("\n")
    end
  end
end
