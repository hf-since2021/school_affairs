class SubjectsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    # if params[:subject_area_id] == "0"
    #   @subjects = SubjectArea.includes(:subject).all
    # else
    #   @subjects = SubjectArea.includes(:subject).find(params[:subject_area_id])
    # end
    @subject_areas = SubjectArea.includes(:subjects) #.all
  end

  def new
    @subject_areas = SubjectArea.includes(:subjects) #.all
    @subject = Subject.new
  end

  def create
    # validation：要編集
    unless params[:subject][:subject_area_id].nil?
      Subject.create(subject_params)
    end
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def subject_params
    params.require(:subject).permit(:code, :name, :subject_area_id)
  end
end
