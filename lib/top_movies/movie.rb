class TopMovies::Movie
  attr_accessor :name, :rating, :reviews, :url

  def self.all
    # I should return a list of top rated RT movies
    puts <<-DOC.gsub /^\s*/, ''
    1. 99% - Wizard of Oz - 109
    2. 100%- Citizen Kane - 75
    3. 100% - The Third Man - 77
    DOC
    movie_1 = self.new
    movie_1.name = "Wizard of Oz"
    movie_1.rating = "99%"
    movie_1.review = "109"
    movie_1.url = "https://www.rottentomatoes.com/m/the_wizard_of_oz_1939"

    movie_2 = self.new
    movie_2.name = "Citizen Kane"
    movie_2.rating = "100%"
    movie_2.review = "77"
    movie_2.url = "https://www.rottentomatoes.com/m/citizen_kane"

    [movie_1, movie_2]
  end

end
