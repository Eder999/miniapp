# encoding: UTF-8

class IndexController < ApplicationController

  def index
    if user_signed_in?
      redirect_to controller: :main, action: :main
    else
      redirect_to new_user_session_path
    end
  end

end
