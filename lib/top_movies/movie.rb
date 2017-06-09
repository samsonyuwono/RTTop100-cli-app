class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :ranking, :year


  def self.all
    self.scrape_top_movie_list
  end
  # 
  # def find_by_name
  # end
  #
  # def find_by_ranking
  # end

    # Go to RT's top 100 list
    # extract properties of each movie
    # instantiate movie
    # everytime I get a movie push it into array
    # movies
    def self.top_movie_list
      movies = []
      movies << self.scrape_top_movies
      movies
      binding.pry
    end

    def title
    end

    def ranking
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
