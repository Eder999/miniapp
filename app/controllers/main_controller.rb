# encoding: UTF-8

class MainController < ApplicationController

  before_action :authenticate_user!

  def main

    @my_lists = List.where(user_id: current_user.id)

    @public_lists = List.where(private: false).where.not(user_id: current_user.id)

    #@favorite_lists = List.where(private: false).where.not(user_id: current_user.id)

  end

end
