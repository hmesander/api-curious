class EventsController < ApplicationController
  def index
    @event_search = EventSearchResult.new(current_user)
  end
end
