require './lib/character'

class Show
attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    all_salaries = characters.map { |character| character.salary }.sum
  end

  def highest_paid_actor
    characters.max_by do |character|
      character.salary
      return character.actor
    end
  end

  def actors
    all_actors = characters.map { |character| character.actor }
  end
end
