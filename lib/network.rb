class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    network_main = @shows.map do |show|
      show.main_characters_by_show
    end.flatten.compact
  end

  def actors_by_show
    @shows.map { |show,actors| [show, show.actors] }.to_h
  end

  def shows_by_actor
    all_actors = @shows.map do |show|
      show.actors
    end.flatten.uniq!

    #didn't get to finish getting from @shows to the show name in this one
    all_actors.map { |actor,show| [actor, @shows] }.to_h
  end

  # def prolific_actors
  #
  # end
end
