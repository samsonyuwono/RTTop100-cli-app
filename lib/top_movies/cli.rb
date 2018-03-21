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

      puts "#{movie.ranking}. #{movie.rating} - #{movie.title} - #{movie.year} - #{movie.reviews} reviews"
    end
  end

  def print_movie(movie)
    puts "---------------------- Your Selection ------------------------------"
    puts "                                                                    "
    puts "                 #{movie.ranking}. - #{movie.rating} - #{movie.title} - #{movie.year}          "
    puts "                                                                   "
    puts "--------------------------------------------------------------------"
  end

  def start
    input = nil
      while input != "exit"
        puts ""
        puts "Please enter a movie title, a number between 1 and 100. Enter a year to see the highest ranked movie for a given year."
        puts ""
        puts "Type in list to see RT's top 100 list again. Type in exit to quit the program"
        input = gets.strip
        if input.to_s == "list"
          list_movies
        elsif input.to_i.between?(1,100)
          if movie = TopMovies::Movie.find_by_ranking(input)
            print_movie(movie)
          end
        elsif input.to_i.between?(1900,2017)
          if movie = TopMovies::Movie.find_by_year(input)
            print_movie(movie)
          end
        elsif input.to_s != (1..100)
          if movie = TopMovies::Movie.find_by_title(input)
          print_movie(movie)
          end
        end
      end
    end
  end


  def goodbye
    puts "---------------------------------------------------------------------"
    puts "                                                                     "
    puts "Thanks for checking in. I hope you picked a movie that you will like!"
    puts "                                                                     "
    puts "---------------------------------------------------------------------"
  end
