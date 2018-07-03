require 'rails_helper'

describe 'User' do
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
        token: 'jdnveipw39r8hueniqw0834beh'
      },
      extra: {
        raw_info: {
          id: '37840583',
          avatar_url: 'https://avatars0.githubusercontent.com/u/33385692?v=4'
        }
      }
    })
  end

  it 'can logout' do
    stub_omniauth

    visit root_path

    expect(page.status_code).to eq(200)

    click_link 'Sign in with Github'

    click_on 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You have logged out')
    expect(page).to_not have_content('Haley Mesander')
    expect(page).to_not have_link('Log in with Github')
  end
end
