require 'rails_helper'

RSpec.describe 'creating a user', type: :feature do
  scenario 'valid inputs' do
    visit new_use_path
    fill_in 'Joe', with: 'joe@gmail.com'
    click_on 'Create user'
    visit users_path
    expect(page).to have_content('j@gmail.com')
  end
end