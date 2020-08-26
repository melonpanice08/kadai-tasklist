class TasksController < ApplicationController
  before_action :require_user_logged_in
  #before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  
  def index
    # @tasks = Task.order(created_at: :desc).page(params[:page]).per(3)
    if logged_in?
      #@user = current_user
      @task = current_user.tasks.build  # form_for 用
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    end
  end

  def show
   correct_user
   #set_task
  end

  def new
    @task = Task.new
  end

  def create
   @task = current_user.tasks.build(task_params)
   #@task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'タスク が登録されました。がんばって！'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク が登録できませんでした。もう一度お願いします。'
      render 'toppages/index'
      #render :new
    end
  end
 
  def edit
    correct_user
     #set_task
  end

  def update
    correct_user
     #set_task
     
     if @task.update(task_params)
      flash[:success] = 'タスク は更新されました'
      redirect_to @task
     else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
     end
  end

  def destroy
     #set_task
     @task.destroy
    flash[:success] = 'タスク は削除されました'
    redirect_back(fallback_location: root_path)
    #redirect_to tasks_url
  end
  
  private
  
  #def set_task
   # @task = Task.find(params[:id])
  #end

  def task_params
    params.require(:task).permit(:content,:status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end