module Sluggable
  extend ActiveSupport::Concern

  included do
    before_create :generate_slug
    validates :slug, uniqueness: true, allow_nil: true
  end

  def to_param
    slug
  end

  private

  def generate_slug
    loop do
      self.slug = SecureRandom.alphanumeric(8)
      break unless self.class.exists?(slug: slug)
    end
  end
end
