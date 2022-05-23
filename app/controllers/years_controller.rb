class YearsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    @years = Year.all.order("years.code ASC")
  end

  def new
    @years = Year.all.order("years.code ASC")
    @year = Year.new
  end

  def create
    Year.create(year_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def year_params
    params.require(:year).permit(:code, :name)
  end
end
