class FreshmansController < ApplicationController
  before_action :set_logined_term

  def index
  end

  def new
    @freshman_student = FreshmanStudent.new
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def freshman_params
    params.require(:freshman_student)
          .permit(:code, ...)
          .merge(year_id: @logined_term.year.id)
  end
end
