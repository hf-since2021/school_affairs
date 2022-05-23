class SectionsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    @sections = Section.all #.order("xxxs.code ASC")
  end

  def new
    @sections = Section.all #.order("xxxs.code ASC")
    @section = Section.new
  end

  def create
    Section.create(section_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def section_params
    params.require(:section).permit(:code, :name)
  end
end
