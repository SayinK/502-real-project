class Event < ApplicationRecord
  has_many :event_memberships, dependent: :destroy
  has_many :users, through: :event_memberships
end
