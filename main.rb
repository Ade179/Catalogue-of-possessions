require_relative './app'
require_relative './console'

def main
  app = App.new

  puts 'Catalogue Of Possessions App'

  loop do
    Console.display_options
    print 'Enter your option >> '
    input = gets.chomp.downcase
    break if input == 'x'

    Console.run_command(app, input)
  end
  app.close
end

main
