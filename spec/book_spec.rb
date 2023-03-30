require_relative './spec_helper'

describe Book do
  describe '#to_s' do
    it 'returns a string representation of the book' do
      book = Book.new('william', 'bad', '2021-03-07', true)
      xptouput = "<Book ID: #{book.id}> [Publisher: william, Cover_state: bad, publish_date: 2021-03-07, archive: true]"

      expect(book.to_s).to eq(xptouput)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      book = Book.new('william-shakespeare', 'bad', '2021-03-07', true)
      expected_output = {
        id: book.id,
        publisher: 'william-shakespeare',
        cover_state: 'bad',
        publish_date: '2021-03-07',
        archived: true
      }
      expect(book.to_h).to eq(expected_output)
    end
  end

  describe '#can_be_archived?' do
    context 'when the book is older than 10 years' do
      it 'returns true' do
        book = Book.new('william-shakespeare', 'good', '2000-01-01', false)
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when the book is newer than 10 years but has a bad cover' do
      it 'returns true' do
        book = Book.new('william-shakespeare', 'bad', '2015-01-01', false)
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when the book is newer than 10 years and has a good cover' do
      it 'returns false' do
        book = Book.new('william-shakespeare', 'good', '2021-01-01', false)
        expect(book.can_be_archived?).to be(false)
      end
    end
  end
end
