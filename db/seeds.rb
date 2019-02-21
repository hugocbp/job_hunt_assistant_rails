require "faker"

print "Creating test user... "
User.create!(email: "test@test.com", password: "123123123")
puts "done!"
user = User.first

print "Creating random users... "
15.times do
  print "."
  User.create(email: Faker::Internet.email, password: "123123123")
end
puts "done!"

print "Creating technologies... "
10.times do
  print "."
  user.technologies.create!({ name: Faker::ProgrammingLanguage.name })
end
puts "done!"

print "Creating companies... "
# ['Microsoft', 'Apple', 'Facebook', 'Amazon', 'Netflix']
10.times do
  print "."
  user.companies.create!({ name: Faker::Company.name })
end
puts "done!"

print "Creating 2 real companies... "
user.companies.create!({ name: "Microsoft", address: "725 Granville St, Vancouver, BC" })
user.companies.create!({ name: "Hootsuite", address: "5 E 8th Ave, Vancouver, BC" })
puts "done!"

print "Creating listings...  "
10.times do
  print "."
  user.listings.create!({
    title: Faker::Job.title,
    company: Company.find(rand(Company.all.size) + 1),
    description: Faker::Lorem.paragraph(20),
    status: rand(4),
  })
end
puts "done!"

print "Creating requirements...  "
20.times do
  print "."
  listing = Listing.find(rand(Listing.all.size).to_i + 1)
  tech = Technology.find(rand(Technology.all.size).to_i + 1)

  if Requirement.where(listing: listing, technology: tech).empty?
    r = Requirement.new({ listing: listing, technology: tech })
    listing.requirements << r
  end
end
puts "done!"
