class JobApplication < ApplicationRecord
  include Sluggable

  belongs_to :user
  has_many :application_events, dependent: :destroy

  STAGES = %w[Prospect Applied Assessment Interview In\ Process Offer Accepted Rejected Withdrawn Ended Archived].freeze

  validates :stage, inclusion: { in: STAGES }
end