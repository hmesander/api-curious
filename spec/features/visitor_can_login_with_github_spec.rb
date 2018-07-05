require 'rails_helper'

describe 'Visitor' do
  it 'can login via Github' do
    stub_omniauth

    visit root_path

    expect(page.status_code).to eq(200)

    click_link 'Sign in with Github'

    expect(current_path).to eq('/hmesander')
    expect(page).to have_content('Welcome, Haley Mesander!')
    expect(page).to have_link('Logout')
  end
end
