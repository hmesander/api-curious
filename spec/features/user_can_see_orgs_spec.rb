require 'rails_helper'

feature 'User clicks on Organizations link' do
  scenario 'they see a list of their organizations', :vcr do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'
    click_link 'Organizations'

    expect(current_path).to eq('/hmesander/organizations')
    expect(page).to have_content('1 Organization')
    expect(page).to have_link('test-org-18973')
    expect(page).to have_css('.org', count: 1)
  end
end
