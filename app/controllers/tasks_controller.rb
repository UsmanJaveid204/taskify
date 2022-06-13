class TasksController < ApplicationController
  before_action :set_task

  def index
    @tasks = Task.all
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
    @task ||= Task.new
  end
end
