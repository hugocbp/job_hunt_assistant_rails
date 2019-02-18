class Requirement < ApplicationRecord
  belongs_to :technology
  belongs_to :listing
end
