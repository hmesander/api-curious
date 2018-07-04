require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: 'github',
    info: {
      nickname: 'hmesander',
      name: 'Haley Mesander',
      screen_name: 'hmesander'
    },
    credentials: {
      token: ENV['token']
    },
    extra: {
      raw_info: {
        id: '37840583',
        avatar_url: 'https://avatars0.githubusercontent.com/u/33385692?v=4'
      }
    }
  })
end

feature "User clicks on 'Respositories'" do
  scenario 'they see a list of their repos ' do
    stub_omniauth

    visit root_path

    click_on 'Log in with Github'

    expect(current_path).to eq(dashboard_path)

    click_on 'Repositories'

    expect(current_path).to eq(repos_path)
    expect(page).to have_content('44 Repositories')
    expect(page).to have_css('.repo', count: 44)
  end
end
