require 'json'

class Storage
  GAME_FILE = './data/game.json'.freeze
  AUTHOR_FILE = './data/author.json'.freeze

  def initialize(app)
    @app = app
  end

  def save_data
    save_games
    save_authors
  end

  def load_data
    load_games(GAME_FILE, @app.game_list)
  end

  private

  def save_games
    games_hash = @app.game_list.map(&:to_h)
    File.write(GAME_FILE, JSON.generate(games_hash))
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
