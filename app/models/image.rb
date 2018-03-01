class Image < ApplicationRecord
  belongs_to :owner, polymorphic: true

  attachment :attached_file, content_type: %w[image/jpeg image/png image/gif]
  validates :attached_file, presence: true
end
