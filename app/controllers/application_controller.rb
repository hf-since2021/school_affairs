class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth
  # ログイン状態検証
  before_action :authenticate_user!, unless: :devise_controller?
  # 要・管理者権限の操作orアクセスをチェック
  before_action :check_admin_authorization
  # 権限のない操作をrootへリダイレクト
  rescue_from CanCan::AccessDenied do |_exception|
    # if user_signed_in?
      redirect_to root_path, alert: '画面を閲覧する権限がありません。'
    # else
      # redirect_to new_user_session_path
    # end
  end


  private

  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def check_admin_authorization
    if request.path.start_with?('/admin') # request.path.start_with?('/users/select')
      authorize! :access_admin_page, :all
    end
  end
end
