class RepoSearchResult
  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    github_service = GithubService.new(@current_user)
    data = github_service.repos
    data.map do |raw_repo|
      Repo.new(raw_repo)
    end
  end
end
