class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, inverse_of: :host
  has_many :event_attendants
  
  has_many :attended_events, through: :event_attendants, source: :event

  validates :username, presence: true
end
