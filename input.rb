require 'date'

class Input
  def self.get_date(prompt)
    loop do
      print prompt
      input = gets.chomp
      begin
        Date.parse(input)
        return input
      rescue ArgumentError
        puts 'Please enter a valid date!'
      end
    end
  end
end
