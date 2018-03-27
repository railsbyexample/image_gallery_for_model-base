##
# Defines the model for images owned by another model
class Image < ApplicationRecord
  belongs_to :owner, polymorphic: true

  acts_as_list scope: %i[owner_id owner_type], top_of_list: 0, add_new_at: :top

  attachment :attached_file, content_type: %w[image/jpeg image/png image/gif]
  validates :attached_file, presence: true
end
