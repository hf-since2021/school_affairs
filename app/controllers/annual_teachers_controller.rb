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
    @teachers = Teacher.includes(:annual_teachers)
    @teacher = Teacher.find(params[:teacher_id])
    @jobs = Job.all
    @sections = Section.all
    @responsibilities = Responsibility.all

    @annual_teacher = AnnualTeacher.create(annual_teacher_params)
    redirect_to action: :edit
  end

  def edit
    @teachers = Teacher.includes(:annual_teachers)
    @teacher = Teacher.find(params[:teacher_id])
    @annual_teacher = AnnualTeacher.find_by(year_id: @logined_term.year.id, teacher_id: params[:teacher_id])
    @jobs = Job.all
    @sections = Section.all
    @responsibilities = Responsibility.all
  end

  def update
    @teachers = Teacher.includes(:annual_teachers)
    @teacher = Teacher.find(params[:teacher_id])
    @jobs = Job.all
    @sections = Section.all
    @responsibilities = Responsibility.all

    @annual_teacher = AnnualTeacher.find_by(year_id: @logined_term.year.id, teacher_id: params[:teacher_id])
    @annual_teacher.update(annual_teacher_params)
    # redirect_to action: :index
    redirect_to action: :edit
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def annual_teacher_params
    params.require(:annual_teacher).permit(:job_id, :section_id, :responsibility_id, :school_grade, :klass).merge(year_id: @logined_term.year.id, teacher_id: params[:teacher_id])
  end
end
