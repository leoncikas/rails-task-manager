class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
