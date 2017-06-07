#Our CLI controller
class TopMovies::CLI

  def call
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "Rottentomatoes top movies:"
    puts <<-DOC.gsub /^\s*/, ''
    1. 99% - Wizard of Oz - 109
    2. 100%- Citizen Kane - 75
    3. 100% - The Third Man - 77
    DOC
    @movies = TopMovies::Movie.all 
  end

  def menu
    input = nil
      while input != "exit"
        puts "Enter the movie (or the number) you would like to learn more about. Type in list to see the list of moves again or type exit to exit:"
        input = gets.strip.downcase
      if input.to_i > 0
        puts @movies [input.to_i]-1
      elsif input == list_movies
        list_movies
      when "1"
        puts "Plot of movie 1"
      when "2"
        puts "Plot of movie 2"
      when "list"
        list_movies
      else
        "Not sure what you want. type list or exit"
      end
    end
end
def goodbye
  puts "Thanks for checking in. I hope you picked a movie that you will like!"
end
end
