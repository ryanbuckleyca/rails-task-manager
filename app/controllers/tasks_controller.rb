class TasksController < ApplicationController
  before_action :find_tasks, only: [:show, :edit, :update, :destroy]
  after_action :redirect, only: [:create, :update, :destroy]

  # As a user, I can list tasks
  def index
    @tasks = Task.all
  end

  # As a user, I can add a new task
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  # as a user, I can view the details of a task
  def show; end

  # As a user, I can edit a task (mark as completed / update title & details)
  def edit; end

  def update
    @task.update(task_params)
  end

  # As a user, I can remove a task
  def destroy
    @task.destroy
  end

  private

  def redirect
    redirect_to task_path(@task)
  end

  def find_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
