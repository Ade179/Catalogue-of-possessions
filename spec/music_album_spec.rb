require 'rspec'
require_relative '../item'
require_relative '../music_album'

describe MusicAlbum do
  before(:all) do
    @music = MusicAlbum.new('DanHeinPee', 'Carl', '2019-11-05', true)
  end

  describe '#to_s' do
    it 'returns a string of the music_album' do
      music_album = MusicAlbum.new('Dusk till Down', 'Alan Walker', '2016-08-01', true)
      expout = "<MusicAlbum ID: #{music_album.id}> [name: Dusk till Down, " \
               'artist: Alan Walker, publish_date: 2016-08-01, on_spotify: true]'
      expect(music_album.to_s).to eq(expout)
    end
  end

  describe '#to_h' do
    it 'returns a hash of the music album' do
      music_album = MusicAlbum.new('Cool you are', 'DBlues', '2016-02-01', false)
      expout = {
        id: music_album.id,
        artist: 'DBlues',
        name: 'Cool you are',
        publish_date: '2016-02-01',
        on_spotify: false
      }
      expect(music_album.to_h).to eq(expout)
    end
  end

  describe '#can_be_archived?' do
    it 'exists' do
      expect(@music).to respond_to(:can_be_archived?)
    end

    it 'returns false' do
      expect(@music.can_be_archived?).to be_falsey
    end
  end
end
