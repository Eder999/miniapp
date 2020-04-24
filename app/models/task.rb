# encoding: UTF-8
class Task < ActiveRecord::Base

  belongs_to :list
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  def close
    #fecha tasks filhos
    self.tasks.where(closed: false).each do |t|
      t.close
    end

    #fecha a si mesmo
    self.closed = true
    self.save

    #fecha task pai se este não possuir nenhum filho aberto
    if self.task_id
      parent = Task.find(self.task_id)
      parent.close if parent.tasks.where(closed: false).size == 0
    end

  end

end
