require_relative '../book'

describe Book do
  context 'When providing book information' do
    book = Book.new('Atoms', 'Bad')

    it 'creates a new book with title Atoms' do
      expect(book).to be_an_instance_of Book
    end

    it 'cover_state of book' do
      expect(book.cover_state).to eq 'Bad'
    end
  end
end
