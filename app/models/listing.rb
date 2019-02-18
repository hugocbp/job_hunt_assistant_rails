class Listing < ApplicationRecord
  belongs_to :user

  has_many :requirements
  has_many :technologies, -> { uniq }, through: :requirements

  validates :title, :company, length: { minimum: 3 }
end
