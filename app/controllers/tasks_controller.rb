class TasksController < ApplicationController
  before_action :set_task, :only => [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_url
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    if @task.due_date > Time.now
        @task.destroy
        redirect_to tasks_url
    else
        flash[:notice] = "It is outdate"
        redirect_to tasks_url

    end

  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :description)
  end

end
