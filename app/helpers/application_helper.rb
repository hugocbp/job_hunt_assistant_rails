module ApplicationHelper
  def get_rating(company)
    company.user_glassdoor_rate || company.scraped_glassdoor_rate || "N/A"
  end

  def get_status(listing)
    case listing.status
    when "not_applied"
      content_tag :span, "Not Applied", class: "badge badge-pill badge-secondary text-light"
    when "applied"
      content_tag :span, "Applied", class: "badge badge-pill badge-info text-light"
    when "called"
      content_tag :span, "Called", class: "badge badge-pill badge-primary text-light"
    when "offered"
      content_tag :span, "Offered", class: "badge badge-pill badge-success text-light"
    when "unsuccessful"
      content_tag :span, "Unsuccessful", class: "badge badge-pill badge-danger text-light"
    end
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? "text-bold nav-link" : "nav-link"

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def on_heroku?
    ENV.any? { |x, _| x =~ /^HEROKU/ }
  end
end
