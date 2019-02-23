require "rails_helper"

RSpec.describe "Scraper" do
  it "gets a rating if there is one" do
    stub_request(:get, /google/).
      with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: "<div>Rating: 4.4</div>", headers: {})

    company = Company.new(name: "Microsoft")
    result = Scraper.get_rating(company)

    expect(result).to eq "4.4"
  end

  it "returns nil if no rating is found" do
    stub_request(:get, /google/).
      with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: "", headers: {})

    company = Company.new(name: "Microsoft")
    result = Scraper.get_rating(company)

    expect(result).to eq nil
  end

  it "does not update rating if recently updated" do
    user = FactoryBot.create(:user)
    company = user.companies.create(name: "Microsoft", scraped_glassdoor_rate: 2.0, last_scraped: Time.now)

    result = Scraper.update_rating(company)

    expect(result).to eq nil
  end

  it "updates rating if last update is more than 1 day old" do
    stub_request(:get, /google/).
      with(headers: { "Accept" => "*/*", "User-Agent" => "Ruby" }).
      to_return(status: 200, body: "<div>Rating: 4.4</div>", headers: {})

    user = FactoryBot.create(:user)
    company = user.companies.create(name: "Microsoft", scraped_glassdoor_rate: 2.0)
    company.update!(last_scraped: 3.days.ago)

    Scraper.update_rating(company)
    company.reload

    expect(company.scraped_glassdoor_rate).to eq 4.4
  end
end
