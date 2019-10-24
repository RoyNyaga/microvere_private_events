class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances, class_name: 'User', source: :attendee

  validates :description, presence: true, length: { maximum: 200 }
  validates_presence_of :date
  validates :location, presence: true, length: { maximum: 100 }
  validates :title, presence: true, length: { maximum: 50 }

  default_scope { order(date: :desc) }
  scope :previous_events, -> { where('date < ?', Time.now) }
  scope :upcoming_events, -> { where('date >= ?', Time.now) }
  scope :today_events, -> { where('date = ?', Date.today) }
end
