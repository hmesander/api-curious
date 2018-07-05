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

feature 'User clicks on Recent Commits link' do
  include Capybara::DSL

  before(:each) do
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  scenario 'they see a list of their recent commits', :vcr do
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
