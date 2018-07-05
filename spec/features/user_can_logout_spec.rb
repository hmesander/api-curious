require 'rails_helper'

describe 'User' do
  it 'can logout' do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'

    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You have logged out')
    expect(page).to_not have_content('Haley Mesander')
    expect(page).to_not have_link('Log in with Github')
  end
end
