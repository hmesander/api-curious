require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] =
  OmniAuth::AuthHash.new(
    { "uid" => "33928379",
      "info" => {
        "nickname" => "hmesander",
        "email" => "haleymesander@gmail.com",
        "name" => "Haley Mesander",
        "urls" => { "GitHub" => "https://github.com/hmesander", "Blog" => ""}
      },
      "credentials" => {"token" => ENV['token'] },
      "extra" =>
      {
        "raw_info" =>
        {
           "avatar_url" => 'https://avatars0.githubusercontent.com/u/33385692?s=400&u=a0cfc39c9abc7b8fb80c85c6fc7999bdc96ed7b8&v=4',
           "public_repos" => 44,
           "followers" => 1,
           "following" => 0,
        }
      }
    }
  )
end

feature 'User clicks on Profile Information link' do
  include Capybara::DSL

  before(:each) do
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  scenario 'they see their profile information', :vcr do
    visit root_path

    click_link 'Sign in with Github'

    expect(current_path).to eq('/hmesander')
    expect(page).to have_xpath("//img[contains(@src,'https://avatars0.githubusercontent.com/u/33385692?s=400&u=a0cfc39c9abc7b8fb80c85c6fc7999bdc96ed7b8&v=4')]")
    expect(page).to have_link('Repositories')
    expect(page).to have_link('Organizations')
    expect(page).to have_link('Recent Commits')
    expect(page).to have_content('Number of Followers: 1')
    expect(page).to have_content('Number of People Following: 0')
  end
end
