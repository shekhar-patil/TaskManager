class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.valid?
			@task.save
			redirect_to task_url(@task)
		else
			render 'new'
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

		# Checks for validations as well
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
			params.require(:task).permit(:description)    
		end

end
