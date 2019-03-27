class TasksController < ApplicationController
  before_action :require_login
  skip_before_action :verify_authenticity_token, :only => [:update_state, :update]

  def index
    @tasks = policy_scope(Task)
  end

  def new
    @task = Task.new
  end

  def create
    @user = User.find(user_params[:user_id])
    @task = @user.tasks.new(task_params)
    authorize @task
    @task.creator_id = current_user.id
    
    if @task.valid?
      @task.save
      redirect_to task_url(@task)  
    else
      render new
    end
  end

  def show
    @task = Task.find(params[:id])
    authorize @task
  end

  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  def update
    @task = Task.find(params[:id])
    authorize @task

    if @task.update_attributes(task_params)
    redirect_to @task
    end
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task
    @task.destroy
    redirect_to tasks_url
  end

  private 

    def task_params
      params.require(:task).permit(:id, :description, :state)
    end
  
    def user_params
      params.require(:user).permit(:user_id)
    end
end
