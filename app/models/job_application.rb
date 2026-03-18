class JobApplication < ApplicationRecord
  include Sluggable

  belongs_to :user
  has_many :application_events, dependent: :destroy
end
