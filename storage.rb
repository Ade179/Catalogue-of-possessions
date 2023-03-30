require 'json'

class Storage
  GAME_FILE = './data/game.json'.freeze
  AUTHOR_FILE = './data/author.json'.freeze
  BOOK_FILE = './data/book.json'.freeze
  LABEL_FILE = './data/label.json'.freeze
  MUSIC_ALBUM_FILE = './data/music_album.json'.freeze
  GENRE_FILE = './data/genre.json'.freeze

  def initialize(app)
    @app = app
  end

  def save_data
    save_games
    save_authors
    save_books
    save_label
    save_music_albums
    save_genres
  end

  def load_data
    load_games(GAME_FILE, @app.game_list)
    load_authors(AUTHOR_FILE, @app.author_list)
    load_book(BOOK_FILE, @app.books)
    load_label(LABEL_FILE, @app.label_list)
    load_music_albums(MUSIC_ALBUM_FILE, @app.music_album_list)
    load_genre(GENRE_FILE, @app.genre_list)
  end

  private

  def save_games
    games_hash = @app.game_list.map(&:to_h)
    File.write(GAME_FILE, JSON.generate(games_hash))
  end

  def save_authors
    authors_hash = @app.author_list.map(&:to_h)
    File.write(AUTHOR_FILE, JSON.generate(authors_hash))
  end

  def save_books
    book_hash = @app.books.map(&:to_h)
    File.write(BOOK_FILE, JSON.generate(book_hash))
  end

  def save_label
    label_hash = @app.label_list.map(&:to_h)
    File.write(LABEL_FILE, JSON.generate(label_hash))
  end

  def save_music_albums
    music_album_hash = @app.music_album_list.map(&:to_h)
    File.write(MUSIC_ALBUM_FILE, JSON.generate(music_album_hash))
  end

  def save_genres
    genres_hash = @app.genre_list.map(&:to_h)
    File.write(GENRE_FILE, JSON.generate(genres_hash))
  end

  def load_book(filename, array)
    books = read_file(filename)
    books.each do |book|
      publisher = book['publisher']
      cover_state = book['cover_state']
      publish_date = book['publish_date']
      archived = book['archived']

      array << Book.new(publisher, cover_state, publish_date, archived)
    end
  end

  def load_label(filename, array)
    labels = read_file(filename)
    labels.each do |label|
      title = label['title']
      color = label['color']

      array << Label.new(title, color)
    end
  end

  def load_games(filename, array)
    data = read_file(filename)
    data.each do |item|
      title = item['title']
      multiplayer = item['multiplayer']
      publish_date = item['publish_date']
      last_played_at = item['last_played_at']

      array << Game.new(title: title, multiplayer: multiplayer, publish_date: publish_date,
                        last_played_at: last_played_at)
    end
  end

  def load_authors(filename, array)
    data = read_file(filename)
    data.each do |item|
      first_name = item['first_name']
      last_name = item['last_name']

      array << Author.new(first_name, last_name)
    end
  end

  def load_music_albums(filename, array)
    music_albums = read_file(filename)
    music_albums.each do |music_album|
      name = music_album['name']
      artist = music_album['artist']
      publish_date = music_album['publish_date']
      on_spotify = music_album['on_spotify']

      array << MusicAlbum.new(name, artist, publish_date, on_spotify)
    end
  end

  def load_genre(filename, array)
    genres = read_file(filename)
    genres.each do |genre|
      name = genre['name']

      array << Genre.new(name)
    end
  end

  def read_file(filename)
    return [] unless File.exist?(filename)

    file = File.open(filename)
    data = file.read
    file.close
    return JSON.parse(data) unless data.empty?

    []
  end
end
