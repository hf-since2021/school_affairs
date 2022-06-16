class FreshmansController < ApplicationController
  before_action :set_logined_term

  def index
    # 次年度を紐付けなければならないので、これではダメ
    @freshman_students = AnnualStudent.where(year_id: @logined_term.year.id).includes(:students)
  end

  def new
    @freshman_student = FreshmanStudent.new
  end

  def create
    @freshman_student = FreshmanStudent.new(freshman_params)
    # if @freshman_student.valid?
      @freshman_student.save
      redirect_to root_path
    # else
    #   render :new
    # end
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def freshman_params
    params.require(:freshman_student)
          .permit(:code, :last_name, :first_name, :last_name_reading, :first_name_reading, :sex, :school_grade)
          .merge(year_id: @logined_term.year.id) # 次年度を紐付けなければならないので、これではダメ
  end
end