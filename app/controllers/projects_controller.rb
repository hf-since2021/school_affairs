class ProjectsController < ApplicationController
  # before_action :authenticate_user! #(-> application_controller)
  before_action :set_logined_term

  def index
    @projects = Project.all
  end

  def show
    @projects = Project.all
    # @project_name = Project.find(params[:id]).name
  end

  def show2
    # tasks = Project.find(params[:project_id]).task.data
    # tasks = Project.first.task.data
    tasks = [
      {id:"1",name:"タスク1",description:"1つめのタスク",start:"2022-05-22",end:"2022-05-28",progress:90,},
      {id:"2",name:"タスク2",description:"2つめのタスク",start:"2022-05-24",end:"2022-05-28",progress:90,},
      {id:"3",name:"タスク3",description:"3つめのタスク",start:"2022-05-27",end:"2022-06-05",progress:40,},
      {id:"4",name:"タスク4",description:"4つめのタスク",start:"2022-05-29",end:"2022-06-07",progress:50,},
      {id:"5",name:"タスク5",description:"5つめのタスク",start:"2022-06-06",end:"2022-06-08",progress:10,}
    ]
    render json: tasks
  end

  private

  def set_logined_term
    @logined_term = User.includes([:year,:term,:year_term]).find(current_user.id)
  end

  # memo
    # tasks = [
    #   {id:"1",name:"タスク1",description:"1つめのタスク",start:"2022-05-22",end:"2022-05-28",progress:90,},
    #   {id:"2",name:"タスク2",description:"2つめのタスク",start:"2022-05-24",end:"2022-05-28",progress:90,},
    #   {id:"3",name:"タスク3",description:"3つめのタスク",start:"2022-05-27",end:"2022-06-05",progress:40,},
    #   {id:"4",name:"タスク4",description:"4つめのタスク",start:"2022-05-29",end:"2022-06-07",progress:50,},
    #   {id:"5",name:"タスク5",description:"5つめのタスク",start:"2022-06-06",end:"2022-06-08",progress:10,}
    # ]
end
