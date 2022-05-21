class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logined_term

  def index
    @jobs = Job.all
  end

  def new
    @jobs = Job.all
    @job = Job.new
  end

  def create
    Job.create(job_params)
    redirect_to action: :index
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  def job_params
    params.require(:job).permit(:code, :name)
  end
end
