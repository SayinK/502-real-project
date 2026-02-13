class User < ApplicationRecord
  has_one :administrator, dependent: :destroy
  has_many :event_memberships, dependent: :destroy
  has_many :events, through: :event_memberships
end
