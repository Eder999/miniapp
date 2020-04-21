# encoding: UTF-8

class MainController < ApplicationController

  before_action :authenticate_user!

  def main

    @my_lists = List.where(user_id: current_user.id)

    @public_lists = List.where(private: false).where.not(user_id: current_user.id)

    @favorite_ids = ListUser.where(user_id: current_user.id).collect{|l| l.list_id}

    @favorite_lists = List.where(id: @favorite_ids)

  end

end
