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
    "<#{self.class} ID: #{@id}> #{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def to_h 
    {id: @id, first_name: @first_name, last_name: @last_name}
  end
end
