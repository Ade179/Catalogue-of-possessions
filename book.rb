require 'date'
require_relative './item/'

class Book < Item
  attr_accessor :label, :genre, :author, :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date: publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_s
    "<#{self.class} ID: #{@id}>" \
      "[Publisher: #{@publisher}, Cover_state: #{@cover_state}, publish_date: #{@publish_date}, archive: #{@archived}]"
  end

  def to_h
    { id: @id, publisher: @publisher, cover_state: @cover_state, publish_date: @publish_date.to_s,
      archived: @archived }
  end

  def can_be_archived?
    
    super || @cover_state == 'bad'
  end
end

p tempest = Book.new('william-shakespeare', 'bad', '2021-03-07', true)
p tempest.can_be_archived?
