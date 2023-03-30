require_relative './spec_helper'

describe Book do
  context 'When providing book information' do
    book = Book.new('Atoms', 'Bad', '2021-03-03', false)

    it 'creates a new book with title Atoms' do
      expect(book).to be_an_instance_of Book
    end

    it 'cover_state of book' do
      expect(book.cover_state).to eq 'Bad'
    end
  end
end
