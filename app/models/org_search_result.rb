class OrgSearchResult
  def initialize(current_user)
    @user_token = current_user.token
    @nickname = current_user.nickname
  end

  def orgs
    conn = Faraday.new(url: 'https://api.github.com',
                       headers: {
                         'access_token' => @user_token
                       })
    response = conn.get("/users/#{@nickname}/orgs?per_page=100")
    data = JSON.parse(response.body, symbolize_names: true)
    data.map do |raw_repo|
      Org.new(raw_repo)
    end
  end
end
