class Listing < ApplicationRecord
  belongs_to :user

  validates :title, :company, length: { minimum: 3 }
end
