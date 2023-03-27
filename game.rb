require 'date'
require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date:, multiplayer:, last_played_at:)
    super(publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && Time.new.year - @last_played_at.year > 2
  end

  def to_s
    "<#{self.class}> #{self.label.title} [Author: #{self.author.first_name}, Genre: #{self.genre?.name}]"
  end
end

