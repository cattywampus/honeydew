class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @task = Task.new task_params

    respond_to do |format|
      if @task.save
        format.js
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
