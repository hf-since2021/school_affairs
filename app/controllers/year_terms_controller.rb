class YearTermsController < ApplicationController
  before_action :set_logined_term

  def index
    @year_terms = YearTerm.includes(:year, :term) #.all
  end

  def new
    @years = Year.all
    @terms = Term.all
    @year_terms = YearTerm.includes(:year, :term) #.all
    @year_term = YearTerm.new
  end

  def create
    # validation：要編集
    YearTerm.create(year_term_params)
    redirect_to action: :index
  end

  # def select
  # end

  # def switch
  # end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def year_term_params
    codename = "#{Year.find(params[:year_term][:year_id]).code}-#{Term.find(params[:year_term][:term_id]).code}"
    params.require(:year_term).permit(:year_id, :term_id).merge(code: codename, activity: false)
  end

end
