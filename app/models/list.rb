# encoding: UTF-8
class List < ActiveRecord::Base

  belongs_to :user
  has_many :tasks

  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: :task_name_blank?

  validates :name, presence: true

  private

    def task_name_blank?(attributes)
      attributes['name'].blank?
    end

end
