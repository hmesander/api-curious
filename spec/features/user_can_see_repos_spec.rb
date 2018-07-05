require 'rails_helper'

feature 'User clicks on Repositories link' do
  scenario 'they see a list of their repos', :vcr do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'
    click_link 'Repositories'

    expect(current_path).to eq('/hmesander/repos')
    expect(page).to have_content('44 Repositories')
    expect(page).to have_link('api-curious')
    expect(page).to have_css('.repo', count: 44)
  end
end
