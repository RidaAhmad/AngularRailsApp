class Api::V1::TasksController < Api::V1::BaseController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :authenticate_user_from_token!, only: [:create, :update, :destroy]
  before_action :authenticate_owner, only: [:update, :destroy]

  def index
    @tasks = Task.all

    render json: @tasks, each_serializer: TasksIndexSerializer
  end

  def show
    render json: @task, serializer: TaskSerializer, root: nil
  end

  def create
    @task = current_user.tasks.create(task_params)

    if @task.save
      render json: @task, serializer: TaskSerializer, root: nil
    else
      render json: @task.errors
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, serializer: TaskSerializer, root: nil
    else
      render json: @task.errors
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
       params.require(:task).permit(:title)
    end

    def authenticate_owner
      render json: {error: 'Access Denied!'}, status: 401 unless current_user == @task.user
    end
end
