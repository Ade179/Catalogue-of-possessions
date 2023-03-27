require_relative '../item'
class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(tile, color, items = [])
    @id = rand(1000..9999)
    @tile = tile
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_label(self)
  end
end
