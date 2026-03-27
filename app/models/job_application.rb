class JobApplication < ApplicationRecord
  include Sluggable

  belongs_to :user
  has_many :application_events, dependent: :destroy

  STAGES = %w[Prospect Applied Assessment Interview In\ Process Offer Accepted Rejected Withdrawn Ended Archived].freeze

  validates :stage, inclusion: { in: STAGES }

  scope :active, -> { where(archived_at: nil) }
  scope :archived, -> { where.not(archived_at: nil) }
  scope :stale, -> (days = 7) {
    active.where(stage: "applied")
          .where("updated_at < ?", days.days.ago)
  }
end