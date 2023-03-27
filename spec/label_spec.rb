require_relative './label'

describe Label do
  context 'When providing Label information' do
    label = Label.new('Women of Owu', 'Blue')

    it 'creates a new label with title Women of Owu' do
      expect(label).to be_an_instance_of(Label)
    end
  end

  context 'when adding a new book' do
    label = Label.new('Tempest', 'red')
    item = Item.new('The Tempest', 'William Shakespeare')

    it 'adds a new book to the label' do
      expect(label.add_item(item)).to eq(item)
    end
  end
end
