class Company < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy

  validates :name, length: { minimum: 2 }
end
