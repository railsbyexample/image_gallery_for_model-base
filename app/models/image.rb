class Image < ApplicationRecord
  belongs_to :owner, polymorphic: true
  attachment :attached_file
end
