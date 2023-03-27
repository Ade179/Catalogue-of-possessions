require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date

  def initialize(genre: nil, author: nil, source: nil, label: nil, publish_date: nil)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @id = rand(1000..9999)
    @archive = false
  end

  def can_be_archived?
    published = Date.parse(@publish_date)
    if Time.new.year - published.year > 10
      return true
    end
    false
  end

  def move_to_archive?
    if can_be_archived?
      @archive = true
    end
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
