class ResponsibilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logined_term

  def index
    @sections = Section.includes(:responsibilities).all
  end

  def new
    @sections = Section.includes(:responsibilities).all
    @responsibility = Responsibility.new
  end

  def create
    Responsibility.create(responsibility_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def responsibility_params
    params.require(:responsibility).permit(:code, :name, :section_id)
  end
end
