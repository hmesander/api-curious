class GithubService
  include GithubConnection

  def initialize(current_user)
    @current_user = current_user
  end

  def events
    get_json("/users/#{@current_user.nickname}/events?per_page=100")
  end

  def orgs
    get_json("/users/#{@current_user.nickname}/orgs?per_page=100")
  end

  def repos
    get_json("/users/#{@current_user.nickname}/repos?per_page=100")
  end
end
