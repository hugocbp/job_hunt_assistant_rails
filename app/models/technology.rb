class Technology < ApplicationRecord
  belongs_to :user

  has_many :requirements, dependent: :destroy
  has_many :listings, -> { uniq }, through: :requirements

  validates :name, length: { minimum: 2 }
end
