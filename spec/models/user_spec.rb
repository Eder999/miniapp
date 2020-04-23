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

    scenario 'Create public and private list - See another user public list' do
      DatabaseCleaner.clean
      #creating first user
      visit '/users/sign_in'
      expect(page).to have_content('Log in')
      click_link 'Criar Conta'
      expect(page).to have_content('Preencha Seus Dados')
      within('form') do
        fill_in 'user_name', with: 'user1'
        fill_in 'user_last_name', with: 'user1 last name'
        fill_in 'user_email', with: 'user1@test.com'
        fill_in 'user_password', with: 'user1pass'
      end
      click_button 'Cadastrar'
      expect(page).to have_content('Login efetuado com sucesso')

      #creating first user public and private lists
      click_link 'Criar Lista'
      within('form') do
        fill_in 'list_name', with: 'public list user1'
      end
      find('input[name="commit"]').click
      expect(page).to have_content('public list user1')
      click_link 'Criar Lista'
      within('form') do
        fill_in 'list_name', with: 'private list user1'
        find('input[name="list[private]"]').click
      end
      find('input[name="commit"]').click
      expect(page).to have_content('private list user1')
      expect(page).to have_content('Privada')
      click_link 'Deslogar'

      #creating second user
      click_link 'Criar Conta'
      expect(page).to have_content('Preencha Seus Dados')
      within('form') do
        fill_in 'user_name', with: 'user2'
        fill_in 'user_last_name', with: 'user2 last name'
        fill_in 'user_email', with: 'user2@test.com'
        fill_in 'user_password', with: 'user2pass'
      end
      click_button 'Cadastrar'
      expect(page).to have_content('Login efetuado com sucesso')

      #check if second user can see public list of first user
      expect(page).to have_content('public list user1')

      #check if second user cant see private list of first user
      expect(page).to have_no_content('private list user1')
    end

  end

end
