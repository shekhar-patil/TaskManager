class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
	  @task = Task.new(task_params)
		@task.save
		redirect_to task_url(@task)
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		# Checks for validations as well
		if @task.update_attributes(task_params)
			redirect_to @task
		end
	end

	private 

	def task_params
		params.require(:task).permit(:description)    
	end

end
