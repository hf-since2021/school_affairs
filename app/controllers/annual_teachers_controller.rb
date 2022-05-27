class AnnualTeachersController < ApplicationController
  before_action :set_logined_term

  def index
    @teachers = Teacher.includes(:annual_teachers)
  end

  def new
    @teachers = Teacher.includes(:annual_teachers)
    @teacher = Teacher.find(params[:teacher_id])
    @annual_teacher = AnnualTeacher.new
    @jobs = Job.all
    @sections = Section.all
    @responsibilities = Responsibility.all
  end

  def create
  end

  def edit
    @teachers = Teacher.includes(:annual_teachers)
    @teacher = Teacher.find(params[:teacher_id])
    @annual_teacher = AnnualTeacher.find_by(year_id: @logined_term.year.id,teacher_id: params[:teacher_id])
    @jobs = Job.all
    @sections = Section.all
    @responsibilities = Responsibility.all
  end

  def update
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
