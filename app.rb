require_relative './author'
require_relative './game'
require_relative './input'
require_relative './storage'

AUTHORS = [
    ['Stephan', 'King'],
    ['George', 'Orwell'],
    ['JK', 'Rowling']
]

class App 
    attr_reader :game_list, :author_list

    def initialize
        @author_list = []
        @game_list = []
        @label_list = []
        @storage = Storage.new(self)
        init_constants
    end

    def init_constants
        AUTHORS.each do |author|
            @author_list << Author.new(author[0], author[1])
        end
    end

    def display_authors
        @author_list.each_with_index do |author, i|
            puts "#{i+1}. #{author.to_s}"
        end
    end

    def display_games
        return puts "[i] No game here!" if @game_list.empty?
        
        @game_list.each_with_index do |game, i|
            puts "#{i+1}. #{game.to_s}"
        end
    end

    def create_game
        print "Game Title >> "
        title = gets.chomp
        print "Multiplayer (y/n) ? >> "  
        multiplayer = gets.chomp.downcase == 'y'
        publish_date = Input.get_date("Published Date >> ")
        last_played_at = Input.get_date("Last Played Date >> ")

        game = Game.new(publish_date: publish_date, multiplayer: multiplayer, title: title, last_played_at: last_played_at)
        @game_list << game 

        puts "*New game added successfully!", game.to_s
    end

    def close
        puts 'Thanks for using our App'
        @storage.save_data
    end

end