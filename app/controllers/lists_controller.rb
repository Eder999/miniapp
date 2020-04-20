# encoding: UTF-8

class ListsController < ApplicationController

  before_action :authenticate_user!

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to controller: :main, action: :main, notice: 'Lista Criada.'
    end

  end

  def list_params
    if params[:list]
      params.require(:list).permit(:name, :description, :private, :user_id, tasks_attributes: [:name, :description, :_destroy])
    else
      params.permit(:name, :description, :private, :user_id, tasks_attributes: [:name, :description, :_destroy])
    end
  end

end
