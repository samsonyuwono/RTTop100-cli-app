#Our CLI controller
class TopMovies::CLI

  def call
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "Rottentomatoes top movies:"
    @movies = TopMovies::Movie.all
    @movies.each.with_index do |movie, i|
      puts "#{i+1}. #{movie.rating} #{movie.name} - #{movie.reviews}"
  end
end

  def menu
    input = nil
      while input != "exit"
        puts "Enter the movie (or the number) you would like to learn more about. Type in list to see the list of moves again or type exit to exit:"
        input = gets.strip.downcase

      if input.to_i > 0
        the_movie = @movies [input.to_i-1]
        puts "#{the_movie.rating} #{the_movie.name} - #{the_movie.reviews}"
      elsif input == "list"
          list_movies

      else
        "Not sure what you want. type list or exit"
      end
    end
  end
end
def goodbye
  puts "Thanks for checking in. I hope you picked a movie that you will like!"
end
