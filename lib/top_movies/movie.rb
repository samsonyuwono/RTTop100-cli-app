class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :ranking, :url

  def intialize(title, url)
    @title= title
    @url- url
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
      title= row.css(".articleLink").text.strip
      ranking= row.css(".bold").text.gsub(".","")
      year =
      rating= row.css(".tMeterScore").text.gsub("\u00A0", " ")
      number_of_reviews= row.css(".hidden-xs").text
    #parse into rows to get rating, title, number of reviews
    # position= row.css(".bold").first.text #fresh
    # url= row.css("a.unstyled.articleLink").first.attr("href") # "/about/"
  end
end




end
