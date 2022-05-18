class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logined_term
  before_action :set_users_list, only: [:index, :new]

  def index
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.add_role "admin" if params[:admin] == "on"
    user.add_role "manager" if params[:manager] == "on"
    user.add_role "read_only" if params[:read_only] == "on"
    redirect_to action: :new
    # redirect_to action: :index
  end

  def select
    # 年度・学期を渡す
    @year_terms = YearTerm.includes([:year,:term]).order("year_terms.code DESC")
    # @year_terms = YearTerm.includes([:year,:term]).order("year_terms.code ASC")
  end

  def switch
    # ログインする年度・学期を変更する
    current_user.update(year_term_id: params[:year_term_id])
    redirect_to root_url
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def set_users_list
    @users = User.all.order("users.name ASC")
  end

  def user_params
    params.require(:user).permit(:name, :password).merge(year_term_id: YearTerm.find_by(activity: TRUE).id)
  end
end
