class TopMovies::Movie
  attr_accessor :name, :rating, :reviews, :url

  def self.all
    # Scrape RT and return movie stats based on data
    TopMovies::Movie.new("https://www.rottentomatoes.com/top/bestofrt")
    self.scrape_movies
    # movie_1 = self.new
    # movie_1.name = "Wizard of Oz"
    # movie_1.rating = "99%"
    # movie_1.reviews = "109"
    # movie_1.url = "https://www.rottentomatoes.com/m/the_wizard_of_oz_1939"
    #
    # movie_2 = self.new
    # movie_2.name = "Citizen Kane"
    # movie_2.rating = "100%"
    # movie_2.reviews = "77"
    # movie_2.url = "https://www.rottentomatoes.com/m/citizen_kane"
    #
    # [movie_1, movie_2]
  end

  def self.scrape_movies 

end
