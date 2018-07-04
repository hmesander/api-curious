class OrgsController < ApplicationController
  def index
    @org_search = OrgSearchResult.new(current_user)
  end
end
