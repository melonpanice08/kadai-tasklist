class TasksController < ApplicationController
  def index
      @tasks = Task.all
  end

  def show
      @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)
    
      if @task.save
        flash[:success] = 'タスク が登録されました。がんばって！'
        redirect_to @task
      else
        flash.now[:danger] = 'タスク が登録できませんでした。もう一度お願いします。'
        render :new
      end
  end

  def edit
      @task = Task.find(params[:id])
  end

  def update
      @task =Task.find(params[:id])
     
      if @task.update(task_params)
        flash[:success] = 'タスク は更新されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスク は更新されませんでした'
        render :edit
      end
  end

  def destroy
      @task =Task.find(params[:id])
      @task.destroy
      flash[:success] = 'タスク は削除されました'
      redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end
