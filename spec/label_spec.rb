require_relative './spec_helper'

describe Label do
  context 'When providing Label information' do
    label = Label.new('Women of Owu', 'Blue')

    it 'creates a new label with title Women of Owu' do
      expect(label).to be_an_instance_of(Label)
    end
  end

  context 'when adding a new book' do
    label = Label.new('Tempest', 'red')
    it 'adds a new book to the label' do
      item = Item.new(publish_date: '2021-03-03', archived: true)
      label.add_item(item)
      expect(label.items[0]).to eql item
    end
  end
end
