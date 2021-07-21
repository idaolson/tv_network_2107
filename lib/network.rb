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

    hash = Hash.new
    all_actors = @shows.map do |show|
      show.actors
    end.flatten.uniq!

    all_actors.each do |actor|
      hash[actor] = []
    end

    @shows.each do |show|
      show.characters.each do |character|
        hash[character.actor] << show if show.actors.include?(character.actor)
      end
    end
    hash
  end

  def prolific_actors
    shows_by_actor.each do |key, value|
      return [key] if value.length > 1
    end
  end
end
