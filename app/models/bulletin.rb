class Bulletin < ApplicationRecord
  include AASM

  belongs_to :category
  belongs_to :user, inverse_of: "bulletins"

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 2, maximum: 1000 }

  scope :published_or_created_by, ->(user) { published.or(Bulletin.where(user_id: user.id)) }


  aasm column: "state" do
    state :draft, initial: true
    state :under_moderation, :published, :rejected, :archived

    event :to_moderation do
      transitions from: :draft, to: :under_moderation
    end

    event :publish do
      transitions from: :under_moderation, to: :published
    end

    event :reject do
      transitions from: :under_moderation, to: :rejected
    end

    event :archive do
      transitions from: %i[draft under_moderation published rejected], to: :archived
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title state category_id]
  end
end
