module GithubConnection
  def conn
    Faraday.new(url: 'https://api.github.com',
                headers: {
                  'access_token' => @current_user.token
                })
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
