module ApplicationHelper
  def get_rating(company)
    company.user_glassdoor_rate || company.scraped_glassdoor_rate || "N/A"
  end  
end
