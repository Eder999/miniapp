# encoding: UTF-8
class ListUser < ActiveRecord::Base

  has_many :users
  has_many :lists

  def valid
    if ListUser.where(user_id: self.user_id, list_id: self.list_id).size == 0
      true
    else
      false
    end
  end

end
