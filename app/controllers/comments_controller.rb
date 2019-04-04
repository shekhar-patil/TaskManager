class CommentsController < ApplicationController
  before_action :current_user
  before_action :fetch_task

  def create
    @comment = @task.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @task
    end
  end

  private
    def fetch_task
      @task = Task.find(params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end 
end
