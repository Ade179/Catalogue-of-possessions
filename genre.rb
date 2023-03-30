class Genre
  attr_accessor :name, :items

  def initialize(name)
    @id = rand(1000..9999)
    @name = name
    @items = []
  end

  def to_s
    "<#{self.class} ID: #{@id}>" \
      "[name: #{@name} , items: #{@items}]"
  end

  def to_h
    { id: @id, name: @name, items: @items.to_s }
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
