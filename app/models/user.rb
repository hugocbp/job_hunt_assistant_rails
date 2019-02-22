class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :listings, dependent: :destroy
  has_many :technologies, dependent: :destroy
  has_many :companies, dependent: :destroy

  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
end
