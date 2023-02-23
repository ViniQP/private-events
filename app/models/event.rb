class Event < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: "user_id"

  validates :user_id, :title, :description, :date, presence: true
end
