class TopMovies::Movie
  attr_accessor :title, :rating, :reviews, :ranking, :year

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end



  def self.find_by_title(title) #matching movie title
    self.all.detect {|name| name.title == title} #return matching movie title
  end

  def self.find_by_ranking(ranking) #return movie title related to ranking
    self.all.detect{|number| number.ranking == ranking}
  end

    def self.find_by_year(year) #return movie title related to ranking
      self.all.detect{|y| y.year == year}
    end

  def self.scrape_top_movies
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))

      doc.css('.table tr').each do |row|
        if row.css(".articleLink").text.split("(")[0] != nil
          movie= self.new
          movie.title= row.css(".articleLink").text.split("(")[0].strip
          movie.ranking= row.css(".bold").text.gsub(".","")
          movie.year= row.css(".articleLink").text.strip.scan(/\((\w+)/).flatten.join
          movie.rating= row.css(".tMeterScore").text.gsub("\u00A0", " ")
          movie.reviews= row.css(".hidden-xs").text
        end
      end
    end


end
