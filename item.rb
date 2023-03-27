require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date

  def initialize(publish_date:, archived:)
    @id = rand(1000..9999)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
  end

  def can_be_archived?
    return true if Time.new.year - @publish_date.year > 10

    false
  end

  def move_to_archive?
    return unless can_be_archived?

    @archived = true
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end
end
