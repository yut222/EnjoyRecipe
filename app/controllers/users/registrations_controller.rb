# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :forbid_guest_user, {only: [:edit, :update, :destroy]}

  # GET /resource/sign_up
  def new
    super
    @user = User.new
  end

  # POST /resource
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:notice] = "ユーザー認証メールを送信いたしました。認証が完了しましたらログインをお願いいたします。"
  #     redirect_to new_user_session_path
  #   else
  #     flash[:alert] = "ユーザー登録に失敗しました。"
  #     render action: :new and return
  #   end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to new_user_session_path
    else
      flash[:alert] = "ユーザー更新に失敗しました。"
      render action: :edit and return
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

    # アカウント編集後、プロフィール画面に移動する
    def after_update_path_for(resource)
      user_path(id: current_user.id)
    end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def forbid_guest_user
      if @user.email == "guest@example.com"
        flash[:alert] = "ゲストユーザーの編集・退会はできません。"
        redirect_to root_path
      end
    end

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end
end
