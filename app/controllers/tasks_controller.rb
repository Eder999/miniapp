# encoding: UTF-8

class TasksController < ApplicationController

  before_action :authenticate_user!

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to controller: :main, action: :main, notice: 'Tarefa Criada.'
    end

  end

  def close
    @task = Task.find(params[:id])
    if current_user.id == @task.list.user_id
      @task.close
      redirect_to controller: :main, action: :main, notice: 'Tarefa Fechada.'
    else
      redirect_to controller: :main, action: :main, notice: 'Você não pode fechar essa tafera.'
    end
  end

  def task_params
    if params[:task]
      params.require(:task).permit(:name, :description, :list_id, :task_id)
    else
      params.permit(:name, :description, :list_id, :task_id)
    end
  end

end
