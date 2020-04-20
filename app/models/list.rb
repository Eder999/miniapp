# encoding: UTF-8
class List < ActiveRecord::Base

  belongs_to :user
  has_many :tasks

end
