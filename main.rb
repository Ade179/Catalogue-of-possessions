require_relative './app'

def display_options
  puts
  puts 'Available Options'
  puts '[1] List All Books'
  puts '[2] List All Music Albums'
  puts '[3] List All Games'
  puts "[4] List All Genres (e.g. 'Comedy', 'Thriller')"
  puts "[5] List All Labels (e.g. 'Gift', 'New')"
  puts "[6] List All Authors (e.g. 'Stephen King')"
  puts "[7] List All Sources (e.g. 'From a friend', 'Online shop')"
  puts '[8] Add A Book'
  puts '[9] Add A Music Album'
  puts '[10] Add A Game'
  puts '[x] Close The App'
  puts
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

def main
  app = App.new

  puts 'Catalogue Of Possessions App'

  loop do
    display_options
    print 'Enter your option >> '
    input = gets.chomp.downcase
    break if input == 'x'

    case input
    when '1'
      app.list_books
    when '2'
      app.list_music_album
    when '3'
      app.display_games
    when '4'
      app.list_genre
    when '5'
      app.list_labels
    when '6'
      app.display_authors
    when '7'
      puts 'Source list'
    when '8'
      app.add_book
    when '9'
      app.add_music_album
    when '10'
      app.create_game
    else
      puts 'Invalid Option!'
    end
  end
  app.close
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

main
