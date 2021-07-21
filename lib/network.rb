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
    shows.map { |show,actors| [show, show.actors] }.to_h
  end
end
