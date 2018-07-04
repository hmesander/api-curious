class ReposController < ApplicationController
  def index
    @repo_search = RepoSearchResult.new(ENV['token'])
  end
end
