require_relative './author'
require_relative './game'
require_relative './input'
require_relative './storage'
require_relative './book'
require_relative './label'
require_relative './music_album'
require_relative './genre'

AUTHORS = [
  %w[Stephan King],
  %w[George Orwell],
  %w[JK Rowling]
].freeze

class App
  attr_accessor :game_list, :author_list, :books, :label_list, :music_album_list, :genre_list

  def initialize
    @author_list = []
    @game_list = []
    @label_list = []
    @books = []
    @genre_list = []
    @music_album_list = []
    @storage = Storage.new(self)
    @storage.load_data
    init_constants
  end

  def display_authors
    puts '# Author List'
    @author_list.each_with_index do |author, i|
      puts "#{i + 1}. #{author}"
    end
  end

  def display_games
    return puts '[i] No game here!' if @game_list.empty?

    puts '# Game List'
    @game_list.each_with_index do |game, i|
      puts "#{i + 1}. #{game}"
    end
  end

  def list_books
    if @books.empty?
      puts 'There are no books yet'
    else
      @books.each_with_index do |book, i|
        puts "#{i + 1}. #{book}"
      end
    end
  end

  def list_labels
    if @label_list.empty?
      puts 'There are no labels yet'
    else
      @label_list.each_with_index do |label, i|
        puts "#{i + 1}. #{label}"
      end
    end
  end

  def list_genre
    if @genre_list.empty?
      puts 'There are no genre yet'
    else
      @genre_list.each_with_index do |genre, i|
        puts "#{i + 1}. #{genre}"
      end
    end
  end

  def list_music_album
    if @music_album_list.empty?
      puts 'There are no genre yet'
    else
      @music_album_list.each_with_index do |music_album, i|
        puts "#{i + 1}. #{music_album}"
      end
    end
  end

  def create_game
    puts '# Create New Game'
    print 'Game Title >> '
    title = gets.chomp
    print 'Multiplayer (y/n) ? >> '
    multiplayer = gets.chomp.downcase == 'y'
    publish_date = Input.get_date('Published Date >> ')
    last_played_at = Input.get_date('Last Played Date >> ')

    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, title: title,
                    last_played_at: last_played_at)
    @game_list << game

    puts '*New game added successfully!', game.to_s
  end

  def add_book
    puts '# Make a new book'
    print 'Book Publisher :'
    publisher = gets.chomp
    print 'cover_state :'
    cover_state = gets.chomp
    print 'publish_date :'
    publish_date = gets.chomp
    print 'archived:'
    archived = gets.chomp

    book = Book.new(publisher, cover_state, publish_date, archived)
    @books << book
  end

  def add_music_album
    puts '# Create new music album'
    print 'name :: '
    name = gets.chomp
    print 'artist :: '
    artist = gets.chomp
    print 'on_spotify :: '
    on_spotify = gets.chomp

    publish_date = Input.get_date('Published Date:: ')

    music_album = MusicAlbum.new(name, artist, publish_date, on_spotify)
    @music_album_list << music_album
  end

  def close
    puts 'Thanks for using our App!'
    @storage.save_data
  end

  private

  def init_constants
    AUTHORS.each do |author|
      @author_list << Author.new(author[0], author[1])
    end
  end
end
