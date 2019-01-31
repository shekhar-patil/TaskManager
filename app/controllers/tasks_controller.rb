class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    
  end


  private 

  def task_params
    params.required(:task).permit(:description)    
  end
  
end
