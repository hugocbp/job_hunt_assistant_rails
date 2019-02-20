# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
print "Creating user... "
User.create!(email: "test@test.com", password: "123123123")
puts "done!"
user = User.first

print "Creating technologies... "
['React', 'Ruby on Rails', 'Elixir', 'Python', 'Django'].each do |tech|
  user.technologies.create!({ name: tech })
end
puts "done!"

print "Creating companies... "
['Microsoft', 'Apple', 'Facebook', 'Amazon', 'Netflix'].each do |company|
  user.companies.create!({ name: company })
end
puts "done!"

print "Creating listings... "
10.times do |i|
	user.listings.create({
		title: "Listing #{i}",
		company: Company.find(rand(Company.all.size) + 1),
    description: "Some testing text for sample listing #{i}"
	})
end
puts "done!"

print "Creating requirements... "
20.times do
  listing = Listing.find(rand(Listing.all.size) + 1)
  tech = Technology.find(rand(Technology.all.size) + 1)
  
  if Requirement.where(listing: listing, technology: tech).empty?
    r = Requirement.new({listing: listing, technology: tech})
    listing.requirements << r
  end
end
puts "done!"
