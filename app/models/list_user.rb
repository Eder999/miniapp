# encoding: UTF-8
class ListUser < ActiveRecord::Base

  has_many :users
  has_many :lists

  validates :user_id, presence: true
  validates :list_id, presence: true

  def valid
    if ListUser.where(user_id: self.user_id, list_id: self.list_id).size == 0
      true
    else
      false
    end
  end

end
