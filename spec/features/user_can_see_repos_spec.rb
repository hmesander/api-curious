require 'rails_helper'

def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] =
    OmniAuth::AuthHash.new(
      {"uid"=>"33928379",
       "info"=> {
          "nickname"=>"hmesander",
          "email"=>"haleymesander@gmail.com",
          "name"=>"Haley Mesander",
          "urls"=> {"GitHub"=>"https://github.com/hmesander", "Blog"=>""}
        },
        "credentials"=>{"token"=>ENV['token']},
        "extra"=>
        {
          "raw_info"=>
          {
             "avatar_url"=>'https://avatars0.githubusercontent.com/u/33385692?s=400&u=a0cfc39c9abc7b8fb80c85c6fc7999bdc96ed7b8&v=4',
             "public_repos"=>44,
             "followers"=>1,
             "following"=>0,
          }
        }
      }
    )
end

feature 'User clicks on Repositories link' do
  include Capybara::DSL

  before(:each) do
    Capybara.app = ApiCurious::Application
    stub_omniauth
  end

  scenario 'they see a list of their repos', :vcr do
    visit root_path

    click_link 'Sign in with Github'
    click_link 'Repositories'

    expect(current_path).to eq("/hmesander/repos")
    expect(page).to have_content('44 Repositories')
    expect(page).to have_content('api-curious')
    expect(page).to have_css('.repo', count: 44)
  end
end
