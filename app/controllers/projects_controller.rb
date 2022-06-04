class ProjectsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    @projects = Project.all
  end

  def show
    # binding.pry
    # redirect_to action: :index
    @projects = Project.all
    @project_name = Project.find(params[:id]).name
    # @tasks = Project.find(params[:id]).task.data
  end

  def show2
    tasks = Project.find(params[:project_id]).task.data
    render json: tasks
    # binding.pry
    # {"controller"=>"projects", "action"=>"show2", "project_id"=>"1"} permitted: false>
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  # memo
  #   @tasks = [
  #     {id:1,name:"タスク1",description:"1つめのタスク",start:"2022-05-22",end:"2022-05-28",progress:90,},
  #     {id:2,name:"タスク2",description:"2つめのタスク",start:"2022-05-24",end:"2022-05-28",progress:90,},
  #     {id:3,name:"タスク3",description:"3つめのタスク",start:"2022-05-27",end:"2022-06-05",progress:40,},
  #     {id:4,name:"タスク4",description:"4つめのタスク",start:"2022-05-29",end:"2022-06-07",progress:50,},
  #     {id:5,name:"タスク5",description:"5つめのタスク",start:"2022-06-06",end:"2022-06-08",progress:10,}
  #   ]
end
