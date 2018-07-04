class RepoSearchResult
  def initialize(user_token)
    @user_token = user_token
  end

  def repos
    conn = Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.headers['access_token'] = ENV['token']
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get('/users/hmesander/repos')
    data = JSON.parse(response.body, symbolize_names: true)
    data.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
