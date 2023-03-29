require 'json'
require './label'

class Storage
  GAME_FILE = './data/game.json'.freeze
  AUTHOR_FILE = './data/author.json'.freeze
  BOOK_FILE = './data/book.json'.freeze
  LABEL_FILE = './data/label.json'.freeze

  def initialize(app)
    @app = app
  end

  def save_data
    save_games
    save_authors
    save_books
  end

  def load_data
    load_games(GAME_FILE, @app.game_list)
    load_book(BOOK_FILE, @app.books)
    load_label(LABEL_FILE, @app.label_list)
  end

  private

  def save_games
    games_hash = @app.game_list.map(&:to_h)
    File.write(GAME_FILE, JSON.generate(games_hash))
  end

  def save_books
    book_hash = @app.books.map(&:to_h)
    File.write(BOOK_FILE, JSON.generate(book_hash))
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

  def save_label
    label_hash = @app.label_list.map(&:to_h)
    File.write(LABEL_FILE, JSON.generate(label_hash))
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

  def save_authors
    authors_hash = @app.author_list.map(&:to_h)
    File.write(AUTHOR_FILE, JSON.generate(authors_hash))
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
