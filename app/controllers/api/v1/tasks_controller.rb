class Api::V1::TasksController < Api::V1::BaseController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    @tasks = Task.all

    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :ok
    else
      render json: @task.errors
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :ok
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
end
