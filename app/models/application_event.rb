class ApplicationEvent < ApplicationRecord
  include Sluggable

  EVENT_TYPES = %w[assessment interview stage_change offer ended archive update].freeze

  belongs_to :job_application
  belongs_to :user

  before_validation :normalize_event_type

  validates :title, presence: true
  validates :event_type, presence: true, inclusion: { in: EVENT_TYPES }

  private

  def normalize_event_type
    self.event_type = event_type.downcase if event_type.present?
  end
end