class Administrator < ApplicationRecord
  self.primary_key = :user_id

  belongs_to :user

  enum :rank, {
    officer: "officer",
    president: "president"
  }

  scope :officers, -> { where(rank: [:officer, :president]) }
end
