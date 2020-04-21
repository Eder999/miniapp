require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe List, type: :model do
  DatabaseCleaner.clean

  user = User.new(
    name: 'name',
    last_name: 'last_name',
    email: 'email@email',
    password: 'password'
  )
  user.save
  context 'validate not null values' do
    it 'name cant be null' do
      list = List.new(user_id: user.id).save
      expect(list).to eq(false)
    end
    it 'user_id cant be null' do
      list = List.new(name: 'name').save
      expect(list).to eq(false)
    end
    it 'save when correct' do
      list = List.new(name: 'name', user_id: user.id).save
      expect(list).to eq(true)
    end
  end
end
