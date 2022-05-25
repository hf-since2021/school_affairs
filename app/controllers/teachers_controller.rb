class TeachersController < ApplicationController
  before_action :set_logined_term

  def index
    @teachers = Teacher.all.order("teachers.code ASC")
  end

  def new
    @subject_areas = SubjectArea.all.order("subject_areas.code ASC")
    @users = User.all.order("users.name ASC")
    @teachers = Teacher.all.order("teachers.code ASC")
    @teacher = Teacher.new
  end

  def create
    Teacher.create(teacher_params)
    redirect_to action: :index
  end

    private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def teacher_params
    params.require(:teacher).permit(:code, :last_name, :first_name, :last_name_reading, 
                                    :first_name_reading, :subject_area_id, :user_id)
  end
end
