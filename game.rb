require 'date'
require_relative './item'

class Game < Item
  def initialize(publish_date:, archived:, multiplayer:, last_played_at:)
    super(publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && Time.new.year - @last_played_at.year > 2
  end
end

# Checking the method
game = Game.new(publish_date: '2001-2-2', multiplayer: true, last_played_at: '2013-3-3', archived: false)
puts game.can_be_archived?
