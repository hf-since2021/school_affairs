class UsersController < ApplicationController
  def index
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
