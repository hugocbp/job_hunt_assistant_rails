class Requirement < ApplicationRecord
  belongs_to :technology, required: true
  belongs_to :listing, required: true
end
