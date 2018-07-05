require 'rails_helper'

feature 'User visits the user dashboard' do
  scenario 'they see their profile information', :vcr do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'

    expect(current_path).to eq('/hmesander')
    expect(page).to have_xpath("//img[contains(@src,'https://avatars0.githubusercontent.com/u/33385692?s=400&u=a0cfc39c9abc7b8fb80c85c6fc7999bdc96ed7b8&v=4')]")
    expect(page).to have_link('Repositories')
    expect(page).to have_link('Organizations')
    expect(page).to have_link('Recent Activity')
    expect(page).to have_content('Number of Followers: 1')
    expect(page).to have_content('Number of People Following: 0')
  end
end
