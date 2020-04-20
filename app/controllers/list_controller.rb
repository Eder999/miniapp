# encoding: UTF-8

class ListController < ApplicationController

  before_action :authenticate_user!

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to controller: :main, action: :main, notice: 'Lista Criada.'
    else
      redirect_to :back, notice: 'Não foi possível criar a lista.'
    end
  end

  def list_params
    params.require(:list).permit(:name, :description, :private, :user_id)
  end

end
