class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @tasks = Task.all.page(params[:page])
    @p = params[:test]
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が登録されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] ='taskが正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] ='task が更新されませんでした'
      render :edit
    end  
  end
  def destroy
    @task.destroy
    flash[:success] = 'task は正常に削除されました'
    redirect_to tasks_url 
  end
  private
  def set_task
    @task=Task.find(params[:id])
  end
  #strong parameter
  def task_params
    params.require(:task).permit(:content , :status)
  end
end
