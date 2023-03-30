require_relative '../genre'
require_relative '../music_album'


describe Genre do
  before :all do
    @genre = Genre.new('Comedy')
    @music_album = MusicAlbum.new('Sia', 'good', '2005-3-5', false)
  end

  describe '#new' do
    it 'should be a Genre object' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'should return correct Genre name' do
      expect(@genre.name).to eql 'Comedy'
    end
  end

  describe '#add_item' do
    context 'before adding any item' do
      it 'should have an empty list' do
        expect(@genre.items.length).to eql 0
      end
    end

    context 'after adding a music album' do
      it 'should contain exactly one item' do
        @genre.add_item(@music_album)
        expect(@genre.items.length).to eql 1
      end

      it 'should return the correct music album' do
        expect(@genre.items[0]).to eql @music_album
      end
    end
  end
end
