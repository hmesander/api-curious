class EventSearchResult
  def initialize(current_user)
    @current_user = current_user
  end

  def events
    github_service = GithubService.new(@current_user)
    data = github_service.events
    data.map do |raw_repo|
      Event.new(raw_repo, @current_user)
    end
  end
end
