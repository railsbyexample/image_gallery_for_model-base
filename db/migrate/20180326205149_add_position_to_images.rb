##
# Adds a position to images
class AddPositionToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :position, :integer
  end
end
