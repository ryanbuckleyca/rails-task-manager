class TasksController < ApplicationController
  # As a user, I can list tasks
  def index
    @tasks = Task.all
  end

  # As a user, I can add a new task
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    redirect_to task_path(@task)
  end

  # as a user, I can view the details of a task
  def show
    @task = Task.find(params[:id])
  end

  # As a user, I can edit a task (mark as completed / update title & details)
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  # As a user, I can remove a task
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to task_path(@task)
  end
end
