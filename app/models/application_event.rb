class ApplicationEvent < ApplicationRecord
  belongs_to :job_application
  belongs_to :user

  validates :title, :event_type, :starts_at, presence: true
end
