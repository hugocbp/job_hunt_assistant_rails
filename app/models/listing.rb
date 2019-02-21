class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_many :requirements, dependent: :destroy
  has_many :technologies, -> { distinct }, through: :requirements

  validates :title, length: { minimum: 3 }
  validates :url, allow_blank: true, format: URI::regexp(%w(http https))

  enum status: { not_applied: 0, applied: 1, called: 2, offered: 3, abandoned: 5 }

  def next_status
    case self.status
    when "not_applied"
      self.update(status: "applied")
    when "applied"
      self.update(status: "called")
    when "called"
      self.update(status: "offered")
    when "offered"
      self.update(status: "abandoned")
    when "abandoned"
      self.update(status: "not_applied")
    end
  end

  def prev_status
    case self.status
    when "not_applied"
      self.update(status: "abandoned")
    when "applied"
      self.update(status: "not_applied")
    when "called"
      self.update(status: "applied")
    when "offered"
      self.update(status: "called")
    when "abandoned"
      self.update(status: "offered")
    end
  end
end
