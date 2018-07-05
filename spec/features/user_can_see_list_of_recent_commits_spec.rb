require 'rails_helper'

feature 'User clicks on Recent Commits link' do
  scenario 'they see a list of their recent commits', :vcr do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'
    click_link 'Recent Activity'

    expect(current_path).to eq('/hmesander/activity')
    expect(page).to have_content('Recent Commits')
    expect(page).to have_content('hmesander/api-curious:')
    expect(page).to have_link('Merge pull request #6 from hmesander/orgs User Organizations')
    expect(page).to have_css('.commit', count: 21)
  end
end
