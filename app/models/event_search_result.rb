class EventSearchResult
  def initialize(current_user)
    @current_user = current_user
    @user_token = current_user.token
    @nickname = current_user.nickname
  end

  def events
    conn = Faraday.new(url: 'https://api.github.com',
                       headers: {
                         'access_token' => @user_token
                       })
    response = conn.get("/users/#{@nickname}/events?per_page=100")
    data = JSON.parse(response.body, symbolize_names: true)
    data.map do |raw_repo|
      Event.new(raw_repo, @current_user)
    end
  end
end
