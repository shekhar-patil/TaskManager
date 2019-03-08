class TasksController < ApplicationController
	before_action :require_login
	skip_before_action :verify_authenticity_token, :only => [:update_state, :update]

	def index
		@tasks_created = Task.created_tasks(current_user.id)
		@tasks_assigned = Task.assigned_tasks(current_user.id)
		@tasks = (@tasks_created + @tasks_assigned).uniq
		authorize @tasks_created, :can_access_created_task?
		authorize @tasks_assigned, :can_access_assigned_task?
	end

	def new
		@task = Task.new
	end

	def create
		@user = User.find(user_params[:user_id])
		@task = @user.tasks.new(task_params)
		@task.creator_id = session[:user_id]
		
		if @task.valid?
			@task.save
			redirect_to task_url(@task)	
		else
			render new
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])

		if @task.update_attributes(task_params)
			redirect_to @task
		end
	end

	def destroy
		task = Task.find(params[:id])

		task.destroy
		@tasks = Task.all
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
