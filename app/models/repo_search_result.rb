class RepoSearchResult
  def initialize(current_user)
    @user_token = current_user.token
    @nickname = current_user.nickname
  end

  def repos
    conn = Faraday.new(url: 'https://api.github.com',
                       headers: {
                         'access_token' => @user_token
                       })
    response = conn.get("/users/#{@nickname}/repos?per_page=100")
    data = JSON.parse(response.body, symbolize_names: true)
    data.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
