class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_many :requirements, dependent: :destroy
  has_many :technologies, -> { distinct }, through: :requirements

  validates :title, length: { minimum: 3 }
  validates :url, allow_blank: true, format: URI::regexp(%w(http https))

  enum status: [:not_applied, :applied, :called, :offered, :abandoned]
end
