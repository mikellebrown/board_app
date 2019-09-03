class TasksController < ApplicationController
  
  before_action :set_list 
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.new
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        redirect_to [@list, @task]
      else
        render :new
      end
    end

    def update
      Task.update_task(@list.task_id, task_params)
      redirect_to list_tasks_path(@task)
    end

    def destroy
      Task.delete_task(@list.task.id)
      redirect_to list_tasks_path(@task)
    end


  private

  def set_list
    @list = List.single_list(params[:id])
  end 

  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:name)
  end
end
