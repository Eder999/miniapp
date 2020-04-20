# encoding: UTF-8
class List < ActiveRecord::Base

  belongs_to :user
  has_many :tasks

  accepts_nested_attributes_for :tasks

  validates :name, presence: true

end
