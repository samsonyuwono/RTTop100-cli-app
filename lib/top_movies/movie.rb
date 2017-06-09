class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :url

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
      rating= row.css(".tMeterScore").text.gsub("\u00A0", " ")
    #parse into rows to get rating, title, number of reviews
    # title = row.css(".unstyled.articleLink").first.text #"learn more"
    # position= row.css(".bold").first.text #fresh
    # rating = row.css("span.tMeterScore").first.text # "81%"
    # url= row.css("a.unstyled.articleLink").first.attr("href") # "/about/"
  end
end




end

# title, number, year all = doc.css("h3.lister-item").first.text.split
# number =  all[0]
# title = all[1]
# year = all[2] or doc.css(".text-muted").first.text
