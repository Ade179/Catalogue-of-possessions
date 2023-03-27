class Author
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1000..9999)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_author(self)
  end

  def to_s 
    "<#{self.class}> #{self.first_name.capitalize} #{self.last_name.capitalize}"
  end
end
