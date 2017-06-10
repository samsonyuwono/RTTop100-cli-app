#Our CLI controller
class TopMovies::CLI

  def call
    puts "Welcome to Rottentomatoes's Top 100 Highest Ranked Movies:"
    TopMovies::Movie.scrape_top_movies
    list_movies
    start
    goodbye
  end

  def list_movies
    TopMovies::Movie.all.each do |movie|
      puts "#{movie.ranking}. #{movie.rating} - #{movie.title} - #{movie.year} - #{movie.reviews}" 
  end
end

  def print_movie(movie)
    puts "#{movie.title} - #{movie.year} - #{movie.rating} - #{movie.reviews}"
  end

  def start
    input = nil
      while input != "exit"
        puts "Please enter a movie name or a number between 1 and 100"
        input = gets.strip

        if input.to_s == "list"
          list_movies
        elsif input.to_s != (1..100)
        if movie = TopMovies::Movie.find_by_title(input)
        print_movie(movie)
    end
      elsif input.to_s == (1..100)
        if movie = TopMovies::Movie.find_by_ranking(input)
          print_movie(movie)
      end
      else
        puts "We can't find that. Please try again type."
      end
    end
  end
end

def goodbye
  puts "Thanks for checking in. I hope you picked a movie that you will like!"
end
