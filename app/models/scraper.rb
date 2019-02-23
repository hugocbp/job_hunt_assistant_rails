require "nokogiri"
require "open-uri"

class Scraper
  def self.get_rating(company, city = "")
    url = "https://www.google.com/search?q=#{company.name.downcase}+#{city.downcase}+glassdoor"
    html = open(url)
    doc = Nokogiri::HTML.parse(html)

    results = doc.xpath('//div[contains(text(), "Rating: ")]')

    if results.empty?
      rating = nil
    else
      rating = (/Rating: \d.?\d?/).match(results.to_s)[0].sub("Rating: ", "")
    end

    rating
  end

  def self.update_rating(company, city = "")
    # return if Rails.env.test?

    if company.scraped_glassdoor_rate.nil? || company.last_scraped + 1.day < 1.day.ago
      rating = get_rating(company, city)

      company.scraped_glassdoor_rate = rating
      company.last_scraped = Time.now
      company.save
    end
  end
end
