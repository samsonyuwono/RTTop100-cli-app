class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :ranking, :url

  def intialize(title, url)
    @title= title
    @url= url
  end

  def self.all
    # Scrape RT's best 100 and return movie stats on input number out of 100
    self.scrape_movies
  end

  def self.scrape_movies
    movies = []

    movies << self.scrape_movie

    # Go to RT's top 100 list
    # extract properties of each movie
    # instantiate movie
    # everytime I get a movie push it into array
    movies
  end

  def self.scrape_top_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
      doc.css('.table tr').each do |row|
      binding.pry
      movie.title= row.css(".articleLink").text.strip
      movie.ranking= row.css(".bold").text.gsub(".","")
      movie.year= row.css(".articleLink").text.strip.scan(/\((\w+)/).flatten.join
      movie.rating= row.css(".tMeterScore").text.gsub("\u00A0", " ")
      movie.reviews= row.css(".hidden-xs").text
      url=
      end
    end





end
