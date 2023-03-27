def display_options
  puts
  puts 'Available Options'
  puts '[1] List All Books'
  puts '[2] List All Music Albums'
  puts '[3] List All Games'
  puts "[4] List All Genres (e.g 'Comedy', 'Thriller')"
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
  puts 'Catalogue Of Possessions App'

  loop do
    display_options
    input = gets.chomp.downcase
    break if input == 'x'

    case input
    when '1'
      puts 'Book list'
    when '2'
      puts 'Album list'
    when '3'
      puts 'Game list'
    when '4'
      puts 'Genres List'
    when '5'
      puts 'Label list'
    when '6'
      puts 'Author list'
    when '7'
      puts 'Source list'
    when '8'
      puts 'Add a book'
    when '9'
      puts 'Add a music album'
    when '10'
      puts 'Add a game'
    else
      puts 'Invalid Option!'
    end
  end
  puts 'Thanks for using our App'
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

main
