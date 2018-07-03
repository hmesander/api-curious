require 'rails_helper'

describe 'User' do
  it 'can login via Github' do
    visit root_path

    expect(page.status_code).to eq(200)

    click_link 'Sign in with Github'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome, hmesander!')
    expect(page).to have_link('Logout')
  end
end
