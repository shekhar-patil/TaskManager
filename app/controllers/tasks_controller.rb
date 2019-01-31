class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
      
  end


  private 

  def task_params
    params.required(:task).permit(:description)    
  end
  
end
