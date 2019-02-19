module ListingsHelper
  def technologies_to_link_string(listing)
    listing.requirements.map { |r| link_to r.technology.name, r.technology }.join(", ").html_safe
  end
end