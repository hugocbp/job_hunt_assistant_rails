class Technology < ApplicationRecord
  belongs_to :user

  has_many :requirements, dependent: :destroy
  has_many :listings, -> { distinct }, through: :requirements

  validates :name, length: { minimum: 1 }
end
