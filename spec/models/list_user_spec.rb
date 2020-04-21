require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe ListUser, type: :model do
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
    it 'user_id cant be null' do
      list_user = ListUser.new(list_id: list.id).save
      expect(list_user).to eq(false)
    end
    it 'list_id cant be null' do
      list_user = ListUser.new(user_id: user.id).save
      expect(list_user).to eq(false)
    end
    it 'save when correct' do
      list_user = ListUser.new(user_id: user.id, list_id: list.id).save
      expect(list_user).to eq(true)
    end
  end

  context 'validate methods' do
    it 'valid method - cant save if already exist' do
      ListUser.new(user_id: user.id, list_id: list.id).save
      list_user = ListUser.new(user_id: user.id, list_id: list.id).valid
      expect(list_user).to eq(false)
    end
  end

end
