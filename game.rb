require 'date'
require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title

  def initialize(publish_date:, multiplayer:, title:, last_played_at:)
    super(publish_date: publish_date)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && Time.new.year - @last_played_at.year > 2
  end

  def to_s
    "<#{self.class} ID: #{@id}> #{@title.upcase} " \
      "[Multiplayer: #{@multiplayer}, Published: #{@publish_date}, Last Played: #{@last_played_at}]"
  end

  def to_h
    { id: @id, title: @title, multiplayer: @multiplayer, publish_date: @publish_date.to_s,
      last_played_at: @last_played_at.to_s }
  end
end
