# class TopMovies::Scraper
#   attr_accessor :title, :rating, :reviews, :ranking, :year
#
# def self.scrape_top_movies
#   doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/"))
#
#     doc.css('.table tr').each do |row|
#       if row.css(".articleLink").text.split("(")[0] != nil
#         movie= self.new
#         movie.title= row.css(".articleLink").text.split("(")[0].strip
#         movie.ranking= row.css(".bold").text.gsub(".","")
#         movie.year= row.css(".articleLink").text.strip.scan(/\((\w+)/).flatten.join
#         movie.rating= row.css(".tMeterScore").text.gsub("\u00A0", " ").strip
#         movie.reviews= row.css(".hidden-xs").text
#       end
#     end
#   end
#
# end
