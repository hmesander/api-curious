class Event
  attr_reader :repo, :commit_messages

  def initialize(attributes, current_user)
    @current_user = current_user
    @attributes = attributes
    @repo = attributes[:repo][:name]
    @commits = attributes[:payload][:commits]
  end

  def commit_messages
    if @commits && @commits[0][:author][:name] == @current_user.nickname
      @attributes[:payload][:commits].to_a
    else
      []
    end
  end
end
