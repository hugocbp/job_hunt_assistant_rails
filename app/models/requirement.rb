class Requirement < ApplicationRecord
  belongs_to :technology, inverse_of: :listings
  belongs_to :listing, inverse_of: :technologies
end
