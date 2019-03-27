class CommentsController < ApplicationController
  before_action :fetch_task

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    redirect_to @task
  end

  def destory
    @comment = @task.comments.find(params[:id])
    @comment.destory
    redirect_to @task
  end

  private
    def fetch_task
      @task = Task.find(params[:task_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
