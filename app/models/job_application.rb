class JobApplication < ApplicationRecord
  include Sluggable

  belongs_to :user
end
