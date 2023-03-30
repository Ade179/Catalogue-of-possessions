class Console
  def self.display_options
    puts
    puts 'Available Options'
    puts '-[1] List All Books'
    puts '-[2] List All Music Albums'
    puts '-[3] List All Games'
    puts "-[4] List All Genres (e.g. 'Comedy', 'Thriller')"
    puts "-[5] List All Labels (e.g. 'Gift', 'New')"
    puts "-[6] List All Authors (e.g. 'Stephen King')"
    puts '-[7] Add A Book'
    puts '-[8] Add A Music Album'
    puts '-[9] Add A Game'
    puts '-[x] Close The App'
    puts
  end

  def self.run_command(app, input)
    if (1..6).include?(input.to_i)
      Console.display_list(app, input)
    elsif (7..9).include?(input.to_i)
      Console.add_new_item(app, input)
    else
      puts 'Invalid Option!'
    end
  end

  def self.display_list(app, input)
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
    end
  end

  def self.add_new_item(app, input)
    case input
    when '7'
      app.add_book
    when '8'
      app.add_music_album
    when '9'
      app.create_game
    end
  end
end
