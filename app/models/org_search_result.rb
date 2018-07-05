class OrgSearchResult
  def initialize(current_user)
    @current_user = current_user
  end

  def orgs
    github_service = GithubService.new(@current_user)
    data = github_service.orgs
    data.map do |raw_repo|
      Org.new(raw_repo)
    end
  end
end
