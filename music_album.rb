require_relative './item'

class MusicAlbum < Item 
    attr_accessor :on_spotify

    def initialize(name, artist, genre, publish_date, on_spotify)
        super(publish_date)
        @name = name
        @artist = artist
        @genre = genre
        @publish_date = publish_date
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super && @on_spotify
    end
end