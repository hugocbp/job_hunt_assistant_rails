# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "test@test.com", password: "123123123")

user = User.first

['React', 'Ruby on Rails', 'Elixir', 'Python', 'Django'].each do |tech|
  user.technologies.create!({ name: tech })
end

['Microsoft', 'Apple', 'Facebook', 'Amazon', 'Netflix'].each do |company|
  user.companies.create!({ name: company })
end

5.times do |i|
	user.listings.create({
		title: "Listing #{i}",
		company: "Company #{i}",
    description: "Some testing text for sample listing #{i}"
	})
end

15.times do
  listing = Listing.find(rand(Listing.count) + 1)
  tech = Technology.find(rand(Technology.count) + 1)
  
  if Requirement.where(listing: listing, technology: tech).empty?
    r = Requirement.new({listing: listing, technology: tech})
    listing.requirements << r
  end
end