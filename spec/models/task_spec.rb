require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe Task, type: :model do
  DatabaseCleaner.clean
  user = User.new(
    name: 'name',
    last_name: 'last_name',
    email: 'email@email',
    password: 'password'
  )
  user.save

  list = List.new(name: 'name', user_id: user.id)
  list.save

  context 'validate not null values' do
    it 'list_id cant be null' do
      task = Task.new(name: 'name').save
      expect(task).to eq(false)
    end
    it 'name cant be null' do
      task = Task.new(list_id: list.id).save
      expect(task).to eq(false)
    end
    it 'save when correct' do
      task = Task.new(name: 'name', list_id: list.id).save
      expect(task).to eq(true)
    end
  end

  context 'validate methods' do
    task_parent = Task.new(name: 'name', list_id: list.id)
    task_parent.save

    task = Task.new(name: 'name', list_id: list.id, task_id: task_parent.id)
    task.save

    task_child1 = Task.new(name: 'name', list_id: list.id, task_id: task.id)
    task_child1.save

    task_child2 = Task.new(name: 'name', list_id: list.id, task_id: task.id)
    task_child2.save

    it 'close - validate if close itself' do
      task.close
      expect(task.closed).to eq(true)
    end
    it 'close - validate if close parent' do
      task.close
      task_parent = Task.find(task.task_id)
      expect(task_parent.closed).to eq(true)
    end
    it 'close - validate if close childs' do
      task.close
      child1 = Task.find(task_child1.id)
      child2 = Task.find(task_child2.id)
      expect(child1.closed && child2.closed).to eq(true)
    end
  end

end
