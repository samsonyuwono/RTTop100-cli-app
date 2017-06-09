class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :ranking, :year

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.detect do |name|
      name == title.strip
    end
  end

  def self.find_by_ranking(ranking)
    self.all.detect do |number|
      number == ranking.strip
    end
  end

    # Go to RT's top 100 list
    # extract properties of each movie
    # instantiate movie
    # everytime I get a movie push it into array
    # movies
    def self.top_movie_list
      all << self.scrape_top_movies
      binding.pry
    end




  def self.scrape_top_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
      movie= self.new
      doc.css('.table tr').each do |row|
      movie.title= row.css(".articleLink").text.split("(")[0].strip
      movie.ranking= row.css(".bold").text.gsub(".","")
      movie.year= row.css(".articleLink").text.strip.scan(/\((\w+)/).flatten.join
      movie.rating= row.css(".tMeterScore").text.gsub("\u00A0", " ")
      movie.reviews= row.css(".hidden-xs").text

      movie
      end
    end







end
