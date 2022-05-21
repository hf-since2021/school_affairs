class SubjectAreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logined_term

  def index
    @subject_areas = SubjectArea.all
  end

  def new
    @subject_areas = SubjectArea.all
    @subject_area = SubjectArea.new
  end

  def create
    SubjectArea.create(subject_area_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def subject_area_params
    params.require(:subject_area).permit(:code, :name)
  end
end
