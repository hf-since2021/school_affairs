# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    # 権限別画面遷移
    if current_user.has_role?(:admin)
    # 管理者権限は、どの学期にログインするかを選択する画面に遷移
      respond_with resource, location: user_select_path
    else
    # 一般権限は、有効化されている学期に紐づけられてログイン
      active_year = YearTerm.find_by(activity: TRUE)
      current_user.update(year_term_id: active_year.id)
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def after_sign_up_path_for(resource)
  #   # super(resource)
  #   year_term_path(1)
  # end
end
