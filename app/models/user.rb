class User < ApplicationRecord
  has_many :bulletins, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
