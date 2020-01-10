class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :set_task, only: [:show, :edit, :update]
  before_action :correct_user, only: [:destroy]
  
  
  def index
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
  end
  def show
    
  end
  def new 
    @task = current_user.tasks.build
  end
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクが正常に作成されました'
      redirect_to @task
    else
      flash[:danger] = 'タスクが作成されませんでした'
      render :new
    end
  end
  def edit
    
  end
  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else 
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end
  def destroy
    @task.destroy
    
    flash[:success] = 'タスクは正常に削除されました'
    redirect_to root_url
  end
  
  private 
  
  def set_task
    @task = current_user.tasks.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
 
 