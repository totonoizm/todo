class TasksController < ApplicationController

  def index
    @tasks = Task.all
    if params[:id].present?
      @task = Task.find(params[:id])
    else
      @task = Task.new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      @tasks = Task.all
      render "index"
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to request.referer
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:content, :status, :limit)
  end
end
