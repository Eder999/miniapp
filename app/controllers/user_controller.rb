# encoding: UTF-8

class UserController < ApplicationController

  def favorite_list
    @favorite = ListUser.new
    @favorite.user_id = current_user.id
    @favorite.list_id = params[:list_id]

    @favorite.save if @favorite.valid

    redirect_to controller: :main, action: :main, notice: 'Lista Favoritada.'
  end

end
