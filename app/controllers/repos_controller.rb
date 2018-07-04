class ReposController < ApplicationController
  def index
    @repo_search = RepoSearchResult.new(current_user)
  end
end
