class AnnualTeachersController < ApplicationController
  before_action :set_logined_term

  def index
    @teachers = Teacher.includes(:annual_teachers)
  end

  def new
  end

  def create
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  # def teacher_params
  #   params.require(:teacher).permit(:code, :last_name, :first_name, :last_name_reading, 
  #                                   :first_name_reading, :subject_area_id, :user_id)
  # end
end
