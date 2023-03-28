require 'json'

GAME_FILE = './data/game.json'
AUTHOR_FILE = './data/author.json'

class Storage
    def initialize(app)
        @app = app 
    end

    def save_data
        save_games
        save_authors
    end

    def save_games
        games_hash = @app.game_list.map(&:to_h)
        File.write(GAME_FILE, JSON.generate(games_hash))
    end

    def save_authors
        authors_hash = @app.author_list.map(&:to_h)
        File.write(AUTHOR_FILE, JSON.generate(authors_hash))
    end
end

