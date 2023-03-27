class Item
  attr_accessor :id :genre :author :source :label :publish_date
  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archive = false
  end

  def can_be_archived?
    if @publish_date >10
      return true
    end
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
