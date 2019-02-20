class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_many :requirements, dependent: :destroy
  has_many :technologies, -> { uniq }, through: :requirements

  accepts_nested_attributes_for :requirements

  validates :title, length: { minimum: 3 }
end
