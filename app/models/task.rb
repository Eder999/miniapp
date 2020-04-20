# encoding: UTF-8
class Task < ActiveRecord::Base

  belongs_to :list
  has_many :tasks

  validates :name, presence: true

end
