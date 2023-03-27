require_relative './author'
require_relative './game'
require_relative './label'

AUTHORS = [
    ['Stephan', 'King'],
    ['George', 'Orwell'],
    ['JK', 'Rowling']
]

LABELS = [
    ['Title', 'Color'],
    ['CSGO', 'Red'],
    ['My Book', 'Green']
]

class App 
    def initialize
        @author_list = []
        @game_list = []
        @label_list = []
        init_constants
    end

    def init_constants
        AUTHORS.each do |author|
            @author_list << Author.new(author[0], author[1])
        end
        LABELS.each do |label|
            @label_list << Label.new(label[0], label[1])
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
        print "Multiplayer (y/n) ? >> "
        multiplayer = gets.chomp.downcase == 'y'
        print "Published Date >> "
        publish_date = gets.chomp
        print "Last Played Date >> "
        last_played_at = gets.chomp 

        game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
        @game_list << game 

        puts "*New game added successfully!", game.to_s
    end
end