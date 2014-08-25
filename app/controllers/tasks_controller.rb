class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @list = List.find params[:list_id]
    @task = @list.tasks.build

    respond_to do |format|
      format.js
    end
  end

  def create
    @task = Task.new task_params

    respond_to do |format|
      if @task.save
        format.js
      else
        format.js { render :error }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :list_id)
  end
end
