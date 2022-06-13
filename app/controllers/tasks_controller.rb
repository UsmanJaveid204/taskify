class TasksController < ApplicationController
  before_action :set_task

  def index
    @tasks = Task.all
  end

  def create
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: "Task was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
    @task ||= Task.new(task_params)
  end

  def task_params
    return if  params[:task].blank?
    params.require(:task).permit(:description)
  end
end
