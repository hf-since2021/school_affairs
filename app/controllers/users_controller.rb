class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # @logined_term = current_user.year_term.includes([:year,:term])
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
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
end
