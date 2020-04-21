require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe User, type: :model do
  context 'validate not null values' do
    it 'name cant be null' do
      DatabaseCleaner.clean
      user = User.new(
        last_name: 'last_name',
        email: 'email@email',
        password: 'password'
      ).save
      expect(user).to eq(false)
    end
    it 'last_name cant be null' do
      DatabaseCleaner.clean
      user = User.new(
        name: 'name',
        email: 'email@email',
        password: 'password'
      ).save
      expect(user).to eq(false)
    end
    it 'email cant be null' do
      DatabaseCleaner.clean
      user = User.new(
        name: 'name',
        last_name: 'last_name',
        password: 'password'
      ).save
      expect(user).to eq(false)
    end
    it 'password cant be null' do
      DatabaseCleaner.clean
      user = User.new(
        name: 'name',
        last_name: 'last_name',
        password: 'password'
      ).save
      expect(user).to eq(false)
    end
    it 'save when correct' do
      DatabaseCleaner.clean
      user = User.new(
        name: 'name',
        last_name: 'last_name',
        email: 'emaila@email',
        password: 'password'
      ).save
      expect(user).to eq(true)
    end
  end

end
