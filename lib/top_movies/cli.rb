#Our CLI controller
class TopMovies::CLI

  def call
    start
    goodbye
  end

  def list_movies
    puts "Welcome to Rottentomatoes Top 100 Highest Ranked Movies:"
    TopMovies:Movie.all.each.with_index do |movie, i|
      puts "#{i+1}. #{movie.name}"
  end
end

  def start
    list_movies
    input = nil
      while input != "exit"
        puts "Please enter a movie or Enter a number between 1 and 100"
        input = gets.strip
        if input == "list"
          list_movies
        elsif input.to_i != (1..100)
        movie = NowPlaying::Movie.find_by_name(input)
        print_movie(movie)
        puts "#{movie.rating} #{movie.title} - #{movie.reviews}"
      elsif input.to_i == (1..100)
        movie = NowPlaying::Movie.find_by_number(input)
          print_movie(movie)
          puts "#{movie.rating} #{movie.title} - #{movie.reviews}"
      else
        puts "We can't find that. Please type list or exit"
      end
    end
  end
end

def goodbye
  puts "Thanks for checking in. I hope you picked a movie that you will like!"
end
