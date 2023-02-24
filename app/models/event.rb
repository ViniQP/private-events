class Event < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: "user_id"

  has_many :event_attendants
  has_many :attendees, through: :event_attendants, source: :user
  validates :user_id, :title, :description, :date, presence: true

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
