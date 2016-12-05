class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_task, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user_from_token!, only: [:create, :destroy]
  before_action :authenticate_owner, only: [:destroy]

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user = current_user
    @comment.save

    render json: @comment
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def authenticate_owner
      render json: {error: 'Access Denied!'}, status: 401 unless current_user == @comment.user
    end
end
