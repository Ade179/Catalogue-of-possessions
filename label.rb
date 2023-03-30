require_relative './item'
class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = rand(1000..9999)
    @title = title
    @color = color
    @items = []
  end

  def to_s
    "<#{self.class} ID: #{@id}> " \
      "[Title: #{@title} , Color: #{@color}]"
  end

  def to_h
    { id: @id, title: @title, color: @color.to_s }
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_label(self)
  end
end
